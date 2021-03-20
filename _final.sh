#!/bin/bash

########### _final-REMASTERED #################
#
# Script for finding the final name
# Author: Luis Beu
# Modifiers and separators: Luis Beu, Anne Engnath
#
####################################################

# all possible modifiers
modifiers=(
    final
    2.1
    2.0
    forSure
    1.1
    remastered
    test
    new
    NoKidding
    HereWeGo
    thisOne
    thiswilldo
    updated
    100%
    real
    actually
    this
    fix
)

# all possible separators
separators=(
    _
    -
    .
    __
    ___
)

# print usage page
usage() {
    cat <<EOF
Usage: _final [OPTIONS...] FILES...
  -h  --help                      Show this usage summary and exit
  -e                              Only echos back the generated names
      --use_separators=<boolean>  Use separators (e.g. . , - _)
      --modifiers_max=<number>    Maximum modifiers to be generated
EOF
    exit 0
}

if [ $# -eq 0 ]; then
    usage
fi

# set default values
echo_mode=false
use_separators=true
modifiers_max=5

# loop over flags
while test $# -gt 0; do
    case "$1" in
    -h | --help)
        usage
        ;;
    -e)
        echo_mode=true
        shift
        ;;
    --use_separators*)
        use_separators=$(echo "$1" | sed -e 's/^[^=]*=//g')
        # test if empty or not boolean
        if [ "$use_separators" != false ] && [ "$use_separators" != true ]; then
            echo "use_separators to be a boolean"
            exit 128
        fi
        shift
        ;;
    --modifiers_max*)
        modifiers_max=$(echo "$1" | sed -e 's/^[^=]*=//g')
        # check if empty or not number
        if [ -z "$modifiers_max" ] || ((modifiers_max <= 0)); then
            echo "modifiers_max needs to be a number greater then 0"
            exit 128
        fi
        shift
        ;;
    *)
        break
        ;;
    esac
done

# loop over params
for fullpath in "$@"; do
    final_modifier=""

    # seperate file into path, name and extension
    filename="${fullpath##*/}"
    dir="${fullpath:0:${#fullpath}-${#filename}}"
    base="${filename%.[^.]*}"
    ext="${filename:${#base}+1}"

    # catch no extension and .name
    if [[ -z "${base}" && -n "$ext" ]]; then
        base=".$ext"
        ext=""
    elif [[ -n "$ext" ]]; then
        ext=".$ext"
    fi

    # check if directory exists
    if ! $echo_mode && [ -n "$dir" ] && ! [ -d "$dir" ]; then
        echo "$dir: No such file or directory"
        exit 128
    fi

    # get random amout of modifiers
    for ((n = 0; n < $((RANDOM % (modifiers_max - 1 + 1) + 1)); n++)); do
        # check if seperators should be generated
        if "$use_separators"; then
            separator=${separators[$RANDOM % ${#separators[@]}]}
            final_modifier="$final_modifier$separator"
        fi

        # generate random based on modifiers lenght
        rand=$((RANDOM % ${#modifiers[@]}))

        # perform random uppercase modification
        if (((RANDOM % 10 % 5) == 0)); then
            # pick random modifier and transform to uppercase
            modifier=$(echo "${modifiers[$rand]}" | tr '[:lower:]' '[:upper:]')
        else
            # pick random modifier
            modifier=${modifiers[$rand]}
        fi

        # stitch it together
        final_modifier="$final_modifier$modifier"
    done

    # stitch everything together
    generated="$dir$base$final_modifier$ext"
    if $echo_mode; then
        # only echo in echo mode
        echo "$generated"
    else
        # for everything else touch the file
        touch "$generated"
    fi
    # catch error code produced by echo or touch
    retval=$?
    if [ $retval -ne 0 ]; then
        # print error with code
        echo "exited with error code $retval"
    fi
done

# exit script
exit 0

#!/bin/bash

########### _final-REMASTERED #################
#
# Script for finding the final name
# Author: Luis Beu
# Modifiers and separators: Luis Beu, Anne Engnath
#
####################################################

# print usage page
usage() {
    cat <<EOF
usage: _final [-eh] file ...
  -e      only echos the generated names
  -h      this page
EOF
}

# grep values from config files
config_read_file() {
    (grep -E "^${2}=" -m 1 "${1}" 2>/dev/null || echo "VAR=__UNDEFINED__") | head -n 1 | cut -d '=' -f 2-;
}

# get custom config or grep it with from default config file
config_get() {
    val="$(config_read_file config.conf "${1}")";
    if [ "${val}" = "__UNDEFINED__" ]; then
        val="$(config_read_file config.defaults.conf "${1}")";
    fi
    printf -- "%s" "${val}";
}

# set default values
echo_mode=false

# catch option params
if [ "$1" == "-h" ] ; then
    # show usage page
    usage
    exit 0
elif [ "$1" == "-e" ] ; then
    # set apllication in echo only mode
    echo_mode=true
    shift;
fi

# fetch files content
IFS=$'\n' modifiers=($(cat modifiers.txt))
IFS=$'\n' separators=($(cat separators.txt))

# loop over all params
for fullpath in "$@"
do
    final_modifier=""

    # seperate file into path, name and extension
    filename="${fullpath##*/}"
    dir="${fullpath:0:${#fullpath} - ${#filename}}"
    base="${filename%.[^.]*}"
    ext="${filename:${#base} + 1}"

    # catch no extension and .name
    if [[ -z "${base}" && -n "$ext" ]]; then
        base=".$ext"
        ext=""
    elif [[ -n "$ext" ]]; then
        ext=".$ext"
    fi

    # check if directory exists
    if ! $echo_mode && ! [ -z "$dir" ] && ! [ -d "$dir" ]; then
        echo "$dir: No such file or directory"
        exit 1
    fi

    # get random amout of modifiers
    for ((n=0;n<$(( RANDOM % ($(config_get modifiers_max) - 1 + 1 ) + 1 ));n++))
    do
        # check if seperators should be generated
        if $(config_get separators); then
            separator=${separators[$RANDOM % ${#separators[@]} ]}
            final_modifier="$final_modifier$separator"
        fi

        # generate random based on modifiers lenght
        rand=$(($RANDOM % ${#modifiers[@]}))

        # perform random uppercase modification
        if (( ($RANDOM % 10 % 5) == 0)); then
            # pick random modifier and transform to uppercase
            modifier=$(echo ${modifiers[$rand]} | tr a-z A-Z)
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
        echo $generated;
    else
        # for everything else touch the file
        touch $generated;
    fi
    # catch error code produced by echo or touch
    retval=$?
    if [ $retval -ne 0 ]; then
        # print error with code
        echo "exited with error code $retval"
    fi
done

# exit script
exit 0;
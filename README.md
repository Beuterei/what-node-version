[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT HEADER -->
<br />
<p align="center">
  <h3 align="center">what-node-version</h3>

  <p align="center">
    Script for automatically switch node versions based on the configured engine in the package.json
    <br />
    <br />
    ·
    <a href="https://github.com/Beuterei/what-node-version/issues">Report Bug</a>
    ·
    <a href="https://github.com/Beuterei/what-node-version/issues">Request Feature</a>
    ·
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

It tries to parse the specified engine in `package.json`. It used [nvm](https://github.com/nvm-sh/nvm) to switch to the determined version.

## Usage

```bash
wnv run start:dev
```

or evan better: with an alias

```bash
echo 'alias npm="wnv"' >> ~/.bashrc
source ~/.bashrc
npm run start:dev
```

## Installation

```bash
brew install Beuterei/homebrew-tap/wnv
```

or without brew

```bash
# installs to /usr/local/bin/wnv
curl -L https://raw.githubusercontent.com/Beuterei/what-node-version/master/wnv >/usr/local/bin/wnv
chmod 0755 /usr/local/bin/wnv
```

## Parameters

| Parameter   | Description                     |
| ----------- | ------------------------------- |
| `-h --help` | Show the usage summary and exit |

## Force reload of node versions cache

Run command with the `NO_CACHE` environment variable set

```bash
NO_CACHE=1 wnv run some_command
```

## Alias

Override the normal `npm` command to make it easy to use.

```bash
echo 'alias npm="wnv"' >> ~/.bashrc
source ~/.bashrc
```

## Ignore alias

```bash
\npm run start:dev
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/Beuterei/what-node-version.svg?style=flat-square
[contributors-url]: https://github.com/Beuterei/what-node-version/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Beuterei/what-node-version.svg?style=flat-square
[forks-url]: https://github.com/Beuterei/what-node-version/network/members
[stars-shield]: https://img.shields.io/github/stars/Beuterei/what-node-version.svg?style=flat-square
[stars-url]: https://github.com/Beuterei/what-node-version/stargazers
[issues-shield]: https://img.shields.io/github/issues/Beuterei/what-node-version.svg?style=flat-square
[issues-url]: https://github.com/Beuterei/what-node-version/issues
[license-shield]: https://img.shields.io/github/license/Beuterei/what-node-version.svg?style=flat-square

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT HEADER -->
<br />
<p align="center">
  <h3 align="center">what-node-version</h3>

  <p align="center">
    Script for automatically switch node versions based on the configured engine the the package.json
    <br />
    <br />
    ·
    <a href="https://github.com/beuluis/what-node-version/issues">Report Bug</a>
    ·
    <a href="https://github.com/beuluis/what-node-version/issues">Request Feature</a>
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
npm run start:dev
```

## Installation

```bash
brew install beuluis/homebrew-tap/wnv
```

or without brew

```bash
# installs to /usr/local/bin/wnv
curl -L https://raw.githubusercontent.com/beuluis/what-node-version/master/wnv >/usr/local/bin/wnv
chmod 0755 /usr/local/bin/wnv
```

## Parameters

| Parameter   | Description                     |
| ----------- | ------------------------------- |
| `-h --help` | Show the usage summary and exit |

### Force reload of node versions cache

Run command with the `NO_CACHE` environment variable set

```bash
NO_CACHE=1 wnv run some_command
```

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->

## Contact

Luis Beu - me@luisbeu.de

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/beuluis/what-node-version.svg?style=flat-square
[contributors-url]: https://github.com/beuluis/what-node-version/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/beuluis/what-node-version.svg?style=flat-square
[forks-url]: https://github.com/beuluis/what-node-version/network/members
[stars-shield]: https://img.shields.io/github/stars/beuluis/what-node-version.svg?style=flat-square
[stars-url]: https://github.com/beuluis/what-node-version/stargazers
[issues-shield]: https://img.shields.io/github/issues/beuluis/what-node-version.svg?style=flat-square
[issues-url]: https://github.com/beuluis/what-node-version/issues
[license-shield]: https://img.shields.io/github/license/beuluis/what-node-version.svg?style=flat-square

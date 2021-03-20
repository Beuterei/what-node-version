[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT HEADER -->
<br />
<p align="center">
  <h3 align="center">_final-REMASTERED</h3>

  <p align="center">
    Script for finding the final name
    <br />
    <br />
    ·
    <a href="https://github.com/beuluis/_final-REMASTERED/issues">Report Bug</a>
    ·
    <a href="https://github.com/beuluis/_final-REMASTERED/issues">Request Feature</a>
    ·
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

Helps you find the perfect final name for your file

## Usage

```sh
_final HelloWorld.js
```

## Installation

```sh
brew install beuluis/homebrew-tap/_final
```

or without brew

```bash
# installs to /usr/local/bin/_final
curl -L https://raw.githubusercontent.com/beuluis/_final-REMASTERED/master/_final >/usr/local/bin/_final
chmod 0755 /usr/local/bin/_final
```

## Parameters

| Parameter          | Description                         | type      |
| ------------------ | ----------------------------------- | --------- |
| `-h --help`        | Show this usage summary and exit    | -         |
| `-e`               | Only echos back the generated names | -         |
| `--use_separators` | Use separators (e.g. . , - \_)      | `boolean` |
| `--modifiers_max`  | Maximum modifiers to be generated   | `number`  |

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Add more modifiers and separators

Add them at the top of the script. Each line is a modifiers/separators.

Modifiers and separators may only contain characters that are allowed in filenames.

<!-- CONTACT -->

## Contact

Luis Beu - me@luisbeu.de

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/beuluis/_final-REMASTERED.svg?style=flat-square
[contributors-url]: https://github.com/beuluis/_final-REMASTERED/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/beuluis/_final-REMASTERED.svg?style=flat-square
[forks-url]: https://github.com/beuluis/_final-REMASTERED/network/members
[stars-shield]: https://img.shields.io/github/stars/beuluis/_final-REMASTERED.svg?style=flat-square
[stars-url]: https://github.com/beuluis/_final-REMASTERED/stargazers
[issues-shield]: https://img.shields.io/github/issues/beuluis/_final-REMASTERED.svg?style=flat-square
[issues-url]: https://github.com/beuluis/_final-REMASTERED/issues
[license-shield]: https://img.shields.io/github/license/beuluis/_final-REMASTERED.svg?style=flat-square

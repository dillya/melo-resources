# Melo - Resources repository

<p align="center">
  <img src="logo/melo_resources.png" alt="Melo resources" />
</p>

All media resources are stored in this repositories such as logos or icons.

## Getting started

### Installation

The main font used for rendering text is based on `Designosaur` and can be downloaded from
[DaFont](https://www.dafont.com/designosaur.font) website.

To install the font from command line:

```sh
wget -O /tmp/font.zip https://dl.dafont.com/dl/?f=designosaur && unzip /tmp/font.zip -d ~/.local/share/fonts/
```

### Import as Bazel module

This repository is exporting all resources as a **Bazel** module named `melo-resources`.

In the `MODULE.bazel` file of your project, simply add the following lines:

```bazel
bazel_dep(name = "melo-resources", version="1.0.0")

# Direct fetch this git repository
git_override(
    module_name = "melo-resources",
    remote = "https://github.com/dillya/melo-resources",
    commit = "main",
)
```

## Formatting / Linting

Currently, the formatting and linting is done by the `//:check` target as a test:

```sh
bazel test //:check
```

To fix the Bazel formatting issue, please use `//:buildifier.fix`:

```sh
bazel run //:buildifier.fix
```

## Copyright / License

All files from this repository are distributed under the [MIT](LICENSE) license.

Copyright @ 2024 Alexandre Dilly - Sparod

# Nerolab CLI

<a href="https://nerolab.dev/"><img src='https://github.com/Nerolab/nerolab_cli/blob/master/assets/logo_nerolab_text_black.png?raw=true' height = 100></a>


Nerolab Command Line Interface for Dart.

**Special thanks** to [GroovinChip](https://github.com/GroovinChip) with [groovin_cli](https://github.com/GroovinChip/groovin_cli) and [very_good_cli](https://github.com/VeryGoodOpenSource/very_good_cli).

## Installing
```sh
dart pub global activate flutter_nerolab_cli
```

## Commands
### `nerolab create`

Create a nerolab Flutter project in seconds based on the **[Nerolab Core](https://github.com/Nerolab/nerolab_core)** template.

Example:
```sh
nerolab create coba --project_id dev.nerolab.coba
```

(And for funzies - you can write `$ nerolab magic` to do the same thing!)

### `nerolab --help`
See the complete list of commands and usage information.

```sh
🐦 A Nerolab Command Line Interface

Usage: nerolab <command> [arguments]

Global options:
-h, --help           Print this usage information.
    --version        Print the current version.

Available commands:
  create   nerolab create <output directory>
           Creates a new nerolab flutter project in the specified directory.

Run "nerolab help <command>" for more information about a command.
```


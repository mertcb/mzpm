# mzpm

mzpm is a minimal plugin manager for zsh.

## Getting Started

### Requirements

- zsh
- git

### Installation

Clone this repository locally by using git, for example:

```
git clone https://github.com/xylous/mzpm
```

Then add the following line to your zshrc:

```zsh
# load mzpm
source /path/to/plugin/manager/mzpm.zsh
```

## Usage

You can use `mzpm` both in your zshrc and on the command line, provided you
loaded it (see above).

By default, plugins are installed at `$XDG_CACHE_HOME/mzpm/`.

### GitHub

`mzpm` can download plugins from GitHub using the following syntax:

```
mzpm <plugin_author>/<plugin_name>
```

For example, to download and use
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting),
do:

```
mzpm 'zsh-users/zsh-syntax-highlighting'
```

### Local plugins

You can also add a plugin to `mzpm`'s default installation path and tell it to
source it.

For example, to manually load
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting),
do, on the command line:

```
$ git clone 'https://github.com/zsh-users/zsh-syntax-highlighting' "${XDG_CACHE_HOME:-$HOME/.cache}/mzpm/zsh-syntax-highlighting"
$ mzpm 'zsh-syntax-highlighting'
```

Once you've done that, to load that plugin on every zsh startup, add the
following to your zshrc:

```
mzpm 'zsh-syntax-highlighting'
```

## Contributing

Issues and pull requests are welcome.

## License

[MIT](LICENSE)

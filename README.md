# zsh dot files #

**Author**: Asher Bender

**License**: [The MIT License](http://opensource.org/licenses/MIT)

## Overview ##

The .dot files contained in this repository customise [zsh](http://www.zsh.org/)
to provide an enhanced bash-like experience including:

* a simple bash-like prompt
* use of emacs keybindings
* `zsh` completion
* subtle syntax highlighting
* navigation using autojump

The configuration is minimal compared to
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) or
[pretzo](https://github.com/sorin-ionescu/prezto). The configuration is also
visually plain. By building the configuration from scratch, features are only
added 'as needed' - creating a simpler terminal with known features and less
bloat.

## Dependencies ##

The following plugins are used in the `zsh` configuration:

* [autojump](https://github.com/joelthelion/autojump)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [zsh-autosuggestions](https://github.com/tarruda/zsh-autosuggestions)

## Installation ##

Ensure dependencies are available:

```
sudo apt-get install zsh git autojump
```

Clone configuration:
```
git clone https://github.com/asherbender/zsh-dot-files ~/.zsh/
```

Make configuration visible:
```
ln -s ~/.zsh/zshrc ~/.zshrc
```

If `zsh` is not the default shell:
```
chsh -s $(which zsh)
```

For the changes to take affect, log out and log back in. After logging in,
verify that the `zsh` is running:
```
echo $SHELL
```

To update the plugins, run:
```
zsh-update
```

# dotfiles

## Install

### a- Basic set up

```bash 
# unix
git clone https://github.com/kevinzous/dotfiles.git
cd dotfiles
sudo apt install make # automate install using Makefile
make init-config # init folders and files
make update-unix
make install-unix # install python, pip, poetry, zsh...
```

```bash
# macos
git clone https://github.com/kevinzous/dotfiles.git
cd dotfiles
sudo apt install make # automate install using Makefile
make init-config # init folders and files
make init-mac # install homebrew
make install-mac # install python, pip, poetry, zsh...
```

### b- Sync dotfiles by executing install.sh

```bash
chmod +x install.sh && ./install.sh
# update .gitconfig-local
```

## Structure

```bash
.
├── .alias                  # custom aliases. Git-related aliases are defined in .gitconfig and in ~/.oh-my-zsh/plugins/git
├── .bashrc                 # bash config, source .alias and local config (interactive non-login shell)
├── .bash_profile           # source .bashrc (login shell)
├── .gitconfig              # git config
├── .inputrc                # GNU Readline Library config, used here for key bindings
├── .vimrc                  # vim config
├── .zshrc                  # zsh config, source .alias and local config (interactive non-login shell)
├── dotfiles_local          # local config files
│   └── .alias_local        # local alias config
├── install.sh              # sync script
└── Makefile                # list of non-source files for the set up
```

## Install on Windows

- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh.git)
- [poetry](https://python-poetry.org/docs/#osx--linux--bashonwindows-install-instructions)
- [fzf](https://github.com/junegunn/fzf/wiki)
- [tldr](https://github.com/tldr-pages/tldr)
- [pre-commit](https://pypi.org/project/pre-commit/)
- [ffmpeg](https://ffmpeg.org/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [broot: tree structure of folders + interactive search](https://github.com/Canop/brootsee)
- [rdfind: finds duplicate file based on their content sha1 checksum](https://github.com/pauldreik/rdfind)

## References

### Useful sources

- [missing cs, command line](https://missing.csail.mit.edu/2020/command-line/)
- [dotfiles](http://dotfiles.github.io/)
- [shell start up scripts](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)
![shell start up](https://blog.flowblok.id.au/static/images/shell-startup.png)
- [difference-between-login-shell-and-non-login-shell](https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell)

### Dotfiles example

- [git + rsync](https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh)
- [dotbot](https://github.com/anishathalye/dotfiles)

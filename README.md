# dotfiles

## Install

### a- Basic set up
```bash
sudo apt install make # automate install using Makefile
make init-config # init folders and files
make update-unix
make install # install python, pip, poetry, zsh...
```

### b- Sync dotfiles
Go in local dotfiles directory and execute install.sh
```bash
git clone https://github.com/kevinzous/dotfiles.git
cd dotfiles && chmod +x install.sh && ./install.sh
```

## Structure

```
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

## install on Windows 

- WSL 2 : https://docs.microsoft.com/fr-fr/windows/wsl/about
- zsh : https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH 
- oh-my-zsh : https://github.com/ohmyzsh/ohmyzsh.git
- poetry : https://python-poetry.org/docs/#osx--linux--bashonwindows-install-instructions
- fzf : https://github.com/junegunn/fzf/wiki
- tldr : https://github.com/tldr-pages/tldr
- pre-commit : https://pypi.org/project/pre-commit/

## references

### useful sources

- https://missing.csail.mit.edu/2020/command-line/
- http://dotfiles.github.io/
- https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
![shell start up](https://blog.flowblok.id.au/static/images/shell-startup.png)
- https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell 

### dotfiles example

- https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh git + rsync
- https://github.com/anishathalye/dotfiles dotbot

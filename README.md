# dotfiles

## install

go in local dotfiles directory and execute install.sh
```bash
cd dotfiles && source install.sh
```

## structure 

./dotfiles
./dotfiles/.bash_profile
./dotfiles/.gitignore
./dotfiles/.alias
./dotfiles/.gitconfig
./dotfiles/.inputrc
./dotfiles/README.md
./dotfiles/.vimrc
./dotfiles/.zshrc
./dotfiles/.bashrc
./dotfiles/install.sh
./dotfiles/dotfiles-local


~## .bashrc

- setting environment variables (adding that directory to $PATH)
- telling your shell to do clever things (like set -o noclobber) and
- adding various aliases to commands (like alias please=sudo)



## references

### useful sources

- https://missing.csail.mit.edu/2020/command-line/
- http://dotfiles.github.io/
- https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
- https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell 

### dotfiles example

- https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh git + rsync
- https://github.com/anishathalye/dotfiles dotbot


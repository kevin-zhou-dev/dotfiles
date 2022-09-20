SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c# bash strict mode
.ONESHELL:
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

init-config:
	mkdir ~/work ~/personal ~/dotfiles_local
	cp template/.gitconfig-local ~/personal/.gitconfig-personal
	cp template/.gitconfig-local ~/work/.gitconfig-work
	touch ~/dotfiles_local/.alias_local

update-unix:
	sudo apt update -y && sudo apt upgrade -y
	sudo apt autoremove -y

install:
	# install python and pip
	sudo apt install -y python3.9 zsh
	sudo apt-get install -y python3-pip python-is-python3 python3-venv xclip # -y tells apt-get not to prompt you

	# install zshell 
	sudo apt install -y zsh

	# install poetry
	curl -sSL https://install.python-poetry.org | python3 - #version 1.2.0 and above # if certificates pb : change -sSL to -sSLk to ignore certificates (not recommended)
	echo $"export PATH=\"/home/kz_unix/.local/bin:\$PATH\"" >> ~/.zshrc
	
	pip install pre-commit tldr # https://github.com/tldr-pages/tldr
	python3 -m pip install -U yt-dlp

	# Make it your default shell
	#chsh -s $(which zsh)

	# install oh my zsh https://github.com/ohmyzsh/ohmyzsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	# syntax highlighter
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting

	sudo apt autoremove -y

.PHONY: install

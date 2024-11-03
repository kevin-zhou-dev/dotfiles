SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c# bash strict mode https://tech.davis-hansson.com/p/make/
.ONESHELL: # one single shell session for a make recipe
.DELETE_ON_ERROR: # if a Make rule fails, its target file is deleted
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

install-unix:
	# install python and pip
	sudo apt install -y python3.9 zsh
	sudo apt-get install -y python3-pip python-is-python3 python3-venv xclip # -y tells apt-get not to prompt you

	# install zshell
	sudo apt install -y zsh

	# Make it your default shell
	#chsh -s $(which zsh)

	# install oh my zsh https://github.com/ohmyzsh/ohmyzsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	# syntax highlighter
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting

	sudo apt autoremove -y

.PHONY: install

extra-install-unix:
	# install poetry
	curl -sSL https://install.python-poetry.org | python3 - #version 1.2.0 and above # if certificates pb : change -sSL to -sSLk to ignore certificates (not recommended)
	echo $"export PATH=\"/home/kz_unix/.local/bin:\$PATH\"" >> ~/.zshrc

	sudo apt install shellcheck
	python3 -m pip install -U yamllint
	python3 -m pip install -U yt-dlp
	pip install pre-commit tldr # https://github.com/tldr-pages/tldr

init-mac:
	# homebrew
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$(pwd)/.zprofile"
	eval "$(/opt/homebrew/bin/brew shellenv)"

	# remove all icons from dock 
	defaults write com.apple.dock persistent-apps -array; killall Dock

	# change dock autohide delay and time
	# source: https://macos-defaults.com/dock/autohide.html
	defaults write com.apple.dock persistent-apps -array; killall Dock --remove all icons from dock
	defaults write com.apple.dock autohide -bool "true"
	defaults write com.apple.dock autohide-delay -float 0
	defaults write com.apple.dock autohide-time-modifier -float 0.4; killall Dock

	# Faster delete key
	# source: https://superuser.com/questions/677665/increase-the-speed-at-which-the-delete-key-deletes-things-on-osx
	defaults write NSGlobalDomain KeyRepeat -int 0

install-mac:
	# basic tools
	brew install --cask google-chrome
	brew install --cask firefox
	brew install --cask visual-studio-code
	brew install --cask notion
	brew install --cask spotify

	brew install tldr # simplified man page 
	brew install tree # display directories as trees
	brew install fzf # command-line fuzzy finder
	brew install ack # search tool like grep
	brew install jq # json processor
	brew install maccy # macOS clipboard manager # open maccy for the first time and cmd + shift + c

	# oh-my-zsh
	brew install zsh # framework for managing your zsh configuration
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# python and poetry
	brew install pipx
	brew install python@3.12
	pipx install poetry
	pipx ensurepath

	brew install --cask google-cloud-sdk

	# Docker
	curl -f -o Docker.dmg https://desktop.docker.com/mac/main/arm64/137060/Docker.dmg # apple chip v4.27.2 as of 2024-02-08. For other see https://docs.docker.com/desktop/release-notes/ and https://docs.docker.com/desktop/install/mac-install/
	sudo hdiutil attach Docker.dmg
	sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
	sudo hdiutil detach /Volumes/Docker

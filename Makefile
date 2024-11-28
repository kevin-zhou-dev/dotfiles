SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c # bash strict mode https://tech.davis-hansson.com/p/make/
.ONESHELL: # one single shell session for a make recipe
.DELETE_ON_ERROR: # if a Make rule fails, its target file is deleted
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: help
help: ## Show this help. Comments starting with 2 '#' will appear in the command 'make help'.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST) | column -ts ":"

init-config: ## Init config
	mkdir ~/work ~/personal
	cp template/.gitconfig-local ~/personal/.gitconfig-personal
	cp template/.gitconfig-local ~/work/.gitconfig-work
	cp template/.alias_local ~/.alias_local

update-unix: ## Update unix system
	sudo apt update -y && sudo apt upgrade -y
	sudo apt autoremove -y

install-unix: ## Install libs for unix
	# install python and pip
	sudo apt install -y python3.9 zsh
	sudo apt-get install -y python3-pip python-is-python3 python3-venv xclip # -y tells apt-get not to prompt you

	# install zshell and make it default shell
	sudo apt install -y zsh
	#chsh -s $(which zsh)

	# install oh my zsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	# syntax highlighter
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting

	# install poetry
	curl -sSL https://install.python-poetry.org | python3 - #version 1.2.0 and above # if certificates pb : change -sSL to -sSLk to ignore certificates (not recommended)
	echo $"export PATH=\"/home/kz_unix/.local/bin:\$PATH\"" >> ~/.zshrc

	sudo apt install shellcheck
	python3 -m pip install -U yamllint
	python3 -m pip install -U yt-dlp
	pip install pre-commit tldr # https://github.com/tldr-pages/tldr

init-mac: ## Init for mac (install brew + update mac settings)
	# install homebrew
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

install-mac: ## Install libs for mac
	# daily apps
	brew install --cask google-chrome
	brew install --cask firefox
	brew install --cask visual-studio-code
	brew install --cask notion
	brew install --cask spotify
	brew install --cask google-cloud-sdk
	brew install gh

	# oh-my-zsh
	brew install zsh # framework for managing your zsh configuration
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	# python and poetry
	brew install pipx
	brew install python@3.12
	pipx install poetry
	pipx ensurepath

	# useful libs, clis
	brew install tldr # simplified man page 
	brew install tree # display directories as trees
	brew install fzf # command-line fuzzy finder
	brew install ack # search tool like grep
	brew install jq # json processor
	brew install maccy # macOS clipboard manager # open maccy for the first time and cmd + shift + c
	brew install broot # tree structure of folders + interactive search # need to launch broot to finalize install

	# Docker
	curl -f -o Docker.dmg https://desktop.docker.com/mac/main/arm64/137060/Docker.dmg # apple chip v4.27.2 as of 2024-02-08. For other see https://docs.docker.com/desktop/release-notes/ and https://docs.docker.com/desktop/install/mac-install/
	sudo hdiutil attach Docker.dmg
	sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
	sudo hdiutil detach /Volumes/Docker

sync-dotfiles: ## Sync dotfiles moving from ./ folder to ~/ folder
	chmod +x install.sh && ./install.sh

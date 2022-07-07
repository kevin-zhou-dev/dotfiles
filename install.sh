# BASDIR=$(dirname $0)
# cd $BASEDIR 

# ln -s ${PWD}/bashrc ~/.bashrc

#!/usr/bin/env bash

# go to parent directory of BASH_SOURCE (environmment variable)
cd "$(dirname "${BASH_SOURCE}")"; 

# git pull origin main;

function doIt() {
	# transfer files from current directory (.) to home directory (~)
	# -a archive -v verbose -h human-readable --no-perms do not preserve permissions
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "install.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
  # execute commands and refresh env variables in bash_profile
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	# retrieving data from standard input 
	# -p : display a prompt before input -n number of maximum character to be read
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

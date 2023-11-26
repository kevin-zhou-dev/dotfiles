#!/usr/bin/env bash
# shellcheck disable=SC2128
# go to parent directory of BASH_SOURCE (environmment variable)
cd "$(dirname "$BASH_SOURCE")" || exit

# git pull origin main;

function doIt() {
	# transfer files from current directory (.) to home directory (~)
	# -a archive -v verbose -h human-readable --no-perms do not preserve permissions
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".gitignore" \
		--exclude ".osx" \
		--exclude "*.sh" \
		--exclude "*.md" \
		--exclude "*.bak" \
		--exclude "*.sw*" \
		--exclude /template \
		--exclude "Makefile" \
		--exclude ".env" \
		--exclude ".function" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
  # execute commands and refresh env variables in bash_profile
	source "$HOME"/.bash_profile;
}

# temporarily exlude since empty
if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	# retrieving data from standard input
	# -p : display a prompt before input -n number of maximum character to be read
	echo "diff $HOME/ ./ --side-by-side --color --exclude .git/ \
		--exclude .DS_Store \
		--exclude .gitignore \
		--exclude .osx \
		--exclude *.sh \
		--exclude *.md \
		--exclude *.bak \
		--exclude *.sw* \
		--exclude /template \
		--exclude Makefile \
		--exclude .env \
		--exclude .function \
		--exclude LICENSE "
	diff "$HOME"/ ./ --side-by-side --color --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".gitignore" \
		--exclude ".osx" \
		--exclude "*.sh" \
		--exclude "*.md" \
		--exclude "*.bak" \
		--exclude "*.sw*" \
		--exclude /template \
		--exclude "Makefile" \
		--exclude ".env" \
		--exclude ".function" \
		--exclude "LICENSE" ;

	read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

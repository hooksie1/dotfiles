#!/bin/bash

# Create a new directory and enter it
mkd() {
	mkdir -p "$@"
	cd "$@" || exit
}
 
tmpd() {
	local dir
	if [ $# -eq 0 ]; then
		dir=$(mktemp -d)
	else
		dir=$(mktemp -d -t "${1}.XXXXXXXXXX")
	fi
	cd "$dir" || exit
}

c() {
    cd $1;
    ls -G;
}
alias cd="c"


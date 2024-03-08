#!/bin/bash

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@"
	cd "$@" || exit
}
 
function tmpd() {
	local dir
	if [ $# -eq 0 ]; then
		dir=$(mktemp -d)
	else
		dir=$(mktemp -d -t "${1}.XXXXXXXXXX")
	fi
	cd "$dir" || exit
}

function c() {
    cd $1;
    ls -G;
}
alias cd="c"


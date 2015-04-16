#!/bin/bash

bin=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $bin

dir=($1)
if [ -z $1 ]; then
	dir=($( find ../episodes.list.d -name "*.list" -exec basename {} .list \; | sort -g ))
fi

hash=$2
: ${hash:="sha256"}

cd ../download

for d in "${dir[@]}"; do
	cd   $d
	echo $d
	
	${hash}sum -c ../../episodes.list.d/${d}.${hash} | grep FAIL | sed 's#:.*##' | xargs -n 1 --no-run-if-empty rm
	
	cd ..
done


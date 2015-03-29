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
	
	${hash}sum * > ../../episodes.list.d/${d}.${hash}
	
	cd ..
done


#!/bin/bash

bin=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $bin
dwndir="$bin/../download"
mkdir -p $dwndir
cd       $dwndir

lists=($( ls ../episodes.list.d/*.list ))
for l in "${lists[@]}"; do
	f=$( basename $l .list )
	echo $f
	
	mkdir -p $f
	
	cat $l | xargs -n 1 basename | xargs -n 1 -I {} mv {} $f/ 2>/dev/null
done


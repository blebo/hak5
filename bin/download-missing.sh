#!/bin/bash

bin=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $bin
dwndir="$bin/../download"
mkdir -p $dwndir

missing=($( find ../download -type f -exec basename {} \; | cat - ../episodes.list.d/*.list | xargs -n 1 basename | sort | uniq -u ))

for m in "${missing[@]}"; do
	echo $m
	url=$( cat ../episodes.list.d/*.list | grep $m )
	
	wget -c --ca-certificate=$bin/www.pkvpn.com.crt --directory-prefix=$dwndir $url
done


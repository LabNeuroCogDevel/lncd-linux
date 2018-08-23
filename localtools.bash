#!/usr/bin/env bash

# where to put unpackaged utils
utildir=/opt/utils
[ ! -d $utildir ] && mkdir $utildir

# fuzzy args
[ ! -d $utildir/fuzzy_arg ] && git clone https://github.com/WillForan/fuzzy_arg.git $utildir/fuzzy_arg

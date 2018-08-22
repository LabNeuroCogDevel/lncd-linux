#!/usr/bin/env bash

utildir=/opt/utils
[ ! -d $utildir ] && mkdir $utildir
[ ! -d $utildir/fuzzy_arg ] && git clone https://github.com/WillForan/fuzzy_arg.git $utildir/fuzzy_arg

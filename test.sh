#! /bin/bash

alias g="git"
alias gco="git checkout"
alias ix="curl -F 'f:1=<-' ix.io"
gclone() { git clone "https://github.com/$1" $2 $3 $4 $5 $6 $7 $8 $9; }

rm -rf test
mkdir test
cd test

gclone nimterop/nimterop
cd nimterop
gco libversion
nimble develop -y
nimble buildTimeit
nimble bt
cd ..

gclone genotrance/nimpcre
cd nimpcre
nimble develop -y
nimble test
cd ..

gclone genotrance/nimarchive
cd nimarchive
nimble develop -y
nimble test
gco nimteroptest1
nimble test
cd ..

gclone genotrance/nimgit2
cd nimgit2
nimble develop -y
nimble test
gco nimteroptest1
nimble test
cd ..

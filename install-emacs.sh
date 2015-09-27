#!/usr/bin/env bash

export PATH=$OPENSHIFT_EMACS_DIR/bin:$PATH

# working dir
mkdir $OPENSHIFT_EMACS_DIR/temp
cd $OPENSHIFT_EMACS_DIR/temp
wget https://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz
tar -Jxvf emacs-24.5.tar.xz
cd emacs-24.5
./configure --without-x --without-x --prefix=$OPENSHIFT_EMACS_DIR/
make && make install
cd ../

# remove working dir
rm -rf temp

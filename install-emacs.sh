#!/usr/bin/env bash

export PATH=$OPENSHIFT_EMACS_DIR/bin:$PATH
alias rm='rm -rf'

# working dir
mkdir $OPENSHIFT_EMACS_DIR/temp
cd $OPENSHIFT_EMACS_DIR/temp

# install autoconf
curl -OL http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz
tar xzf autoconf-2.69.tar.gz
rm autoconf-2.69.tar.gz
autoconf-2.69/configure --prefix=$OPENSHIFT_EMACS_DIR
make && make install
rm *

# install emacs
git clone git://git.savannah.gnu.org/emacs.git
cd emacs
rm .git
./autogen.sh
./configure --prefix=$OPENSHIFT_EMACS_DIR/ --with-x-toolkit=no --without-toolkit-scroll-bars --without-xaw3d --without-compress-info --without-sound --without-pop --without-xpm --without-tiff --without-rsvg --without-gconf --without-gsettings --without-selinux --without-gpm --without-makeinfo --with-x
make && make install
cd ../

# remove working dir
rm temp

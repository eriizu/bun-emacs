#/bin/bash
# E89 Pedagogical & Technical Lab
# project:     bun-emacs
# created on:  2022-08-09 - 14:34 +0200
# 1st author:  Elise C. Philippe - eriizu
# description: installing config

set -e


DEST=/usr/share/emacs/site-lisp

echo "I will bluntly copy to your ${DEST} folder"
echo "and will need appropriate privileges."

cp -v		src/default.el $DEST/default.el
cp -rv		src/lisp/bunny $DEST/bunny
mkdir -vp	$DEST/site-start.d/
cp -v		src/lisp/site-start.d/bunny-init.el $DEST/site-start.d/bunny-init.el
cp -rv		src/modes $DEST/modes

# Bunny Pedagogical Lab
# project:     bun-emacs
# created on:  2022-08-09 - 14:27 +0200
# 1st author:  Elise C. Philippe - eriizu
# description: collect local home config

cp -v ~/.emacs.d/init.el ./src
mkdir -vp ./src/lisp/
cp -vr ~/.emacs.d/lisp/bunny/ ./src/lisp/
mkdir -vp ./src/lisp/site-start.d/
cp -v ~/.emacs.d/lisp/site-start.d/bunny-init.el ./src/lisp/site-start.d/bunny-init.el
cp -vr ~/.emacs.d/modes ./src/modes

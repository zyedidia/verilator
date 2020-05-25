#!/bin/bash -e

APP_IMAGE_TOOL=${APP_IMAGE_TOOL:-appimagetool-x86_64.AppImage}

./configure --prefix=${PWD}/appImage/usr --disable-defenv --enable-copy-runtime-files-default LDFLAGS=-static
make -j $(nproc)
make install

# clean up things that are not used in this setting
rm -r appImage/usr/share/pkgconfig

$APP_IMAGE_TOOL appImage

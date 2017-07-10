#!/bin/bash

FASTBLANK_PATH=/tmp/fastblank

puppet module build $FASTBLANK_PATH
puppet module install $FASTBLANK_PATH/pkg/sedovandrew-fastblank-0.1.0.tar.gz

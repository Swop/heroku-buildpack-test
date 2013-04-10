#!/usr/bin/env bash

# This is a test script executed by the compile script.
# You can make any tests in this file, but this file must remains a bash script in order to work.
# If you needed to use other language for testing purpose, just call the desired interpreter from this file.
#
# You can force the compilation fail after this script. In order to do this,
# just override the following variable in this script (the initial value is set to 'true'):
#
FORCE_FAILED_COMPILATION=false

echo 'Delete content of cache dir...'
rm -rf $CACHE_DIR/*
#echo $CACHE_DIR

#ls -la $CACHE_DIR

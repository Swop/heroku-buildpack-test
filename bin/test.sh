#!/usr/bin/env bash

# This is a test script executed by the compile script.
# You can make any tests in this file, but this file must remains a bash script in order to work.
# If you needed to use other language for testing purpose, just call the desired interpreter from this file.
#
# You can force the compilation fail after this script. In order to do this,
# just override the following variable in this script (the initial value is set to 'true'):
#
#FORCE_FAILED_COMPILATION=false

echo 'Env vars:'
env

#echo 'whats the executables?'
#for d in /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
#do
#        echo "Executables of ${d}:"
#        ls -l  $d
#done

echo 'Python version:'
python --version

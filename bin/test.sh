#!/usr/bin/env bash

# This is a test script executed by the compile script.
# You can make any tests in this file, but this file must remains a bash script in order to work.
# If you needed to use other language for testing purpose, just call the desired interpreter from this file.
#
# You can force the compilation fail after this script. In order to do this,
# just override the following variable in this script (the initial value is set to 'true'):
#
#FORCE_FAILED_COMPILATION=false

PHP_VERSION=5.5.1
PHP_URL="http://star-down.com/uploads/php-${PHP_VERSION}-heroku.tar.gz"
PHP_PATH="vendor/php"

pwd
echo 'Env vars:'
env
echo "---------------"

echo "---------> Bundling PHP"
mkdir -p $PHP_PATH && cd $PHP_PATH
pwd
curl --silent --max-time 500 --location $PHP_URL | tar xz
ls -l
cd $BUILD_DIR
echo "---------------"
#ls -l ${PHP_PATH}/bin/php || true

export LD_LIBRARY_PATH=${BUILD_DIR}/${PHP_PATH}/icu/lib:${BUILD_DIR}/${PHP_PATH}/ext:${LD_LIBRARY_PATH}
export PATH=${BUILD_DIR}/${PHP_PATH}/bin:$PATH
echo "---------------"
${PHP_PATH}/bin/php -v
echo "---------------"
${PHP_PATH}/bin/php -i


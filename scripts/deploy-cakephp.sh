#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


echo "=============================Install CakePHP Application Skeleton============================================================="
# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md

# EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

# if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
# then
#     >&2 echo 'ERROR: Invalid installer checksum'
#     rm composer-setup.php
#     exit 1
# fi

# php composer-setup.php --quiet
# RESULT=$?
# rm composer-setup.php
# exit $RESULT

wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet

echo "=============================Install CakePHP Application Skeleton finished============================================================="
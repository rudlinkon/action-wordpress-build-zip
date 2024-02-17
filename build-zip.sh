#!/bin/bash

# it does not exit with a 0, and we only care about the final exit.
set -eo

# Install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Install dist-archive command
wp package install wp-cli/dist-archive-command

# Generate WordPress Archive
wp dist-archive . ./wordpress.zip

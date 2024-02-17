#!/bin/bash

# it does not exit with a 0, and we only care about the final exit.
set -eo

# Install WP-CLI
echo '✨Installing WP-CLI✨'
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
echo '✅ Successfully install WP-CLI'

# Install dist-archive command
echo '✨Installing dist-archive-command✨'
wp package install wp-cli/dist-archive-command
echo '✅ Successfully install dist-archive-command'

# Generate WordPress Archive
echo '✨Generating the archive file✨'
wp dist-archive . ./wordpress.zip
echo '🎉 Successfully generated archive file'

#!/bin/bash

# it does not exit with a 0, and we only care about the final exit.
set -eo

# Install WP-CLI
echo '✨Installing WP-CLI...✨'
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
echo '✅ Successfully installed WP-CLI'

# Install dist-archive command
echo '✨Installing dist-archive-command...✨'
wp package install wp-cli/dist-archive-command
echo '✅ Successfully installed dist-archive-command'

# Install Composer if requested
if [ "$INSTALL_COMPOSER" = "true" ]; then
  echo "✨Installing Composer...✨"
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  php -r "unlink('composer-setup.php');"
  echo '✅ Successfully installed Composer'

  # Install Composer dependencies if composer.json exists
  if [ -f "composer.json" ]; then
    echo "✨Installing Composer dependencies..."
    composer install
    echo '✅ Successfully installed Composer dependencies'
  fi
fi

# Install Node.js and run npm build if requested
if [ "$NPM_RUN_BUILD" = "true" ]; then
  echo "✨Installing npm packages..."
  npm install
  echo '✅ Successfully installed npm packages'
  echo "✨Running npm build..."
  npm run build
  echo '✅ Successfully npm build'
fi

# Generate WordPress Archive
echo '✨Generating the archive file✨'
wp dist-archive . ./wordpress.zip
echo '🎉 Successfully generated archive file'

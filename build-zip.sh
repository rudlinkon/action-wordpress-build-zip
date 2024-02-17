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

# Upload Archive as GitHub Artifact
echo "Uploading WordPress archive as artifact..."
mkdir -p $HOME/artifacts
mv ./wordpress.zip $HOME/artifacts/wordpress.zip
echo "archive_path=$HOME/artifacts/wordpress.zip" >> $GITHUB_OUTPUT

# Set retention days for the uploaded artifact
echo "Setting retention days for the uploaded artifact..."
echo "ARTIFACT_RETENTION_DAYS=7" >> "$GITHUB_ENV"

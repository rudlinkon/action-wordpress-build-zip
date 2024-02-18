# WordPress Build Zip GitHub Action

This GitHub Action automates the process of generating a zip archive of a WordPress project using WP-CLI and uploads it as an artifact.

## Usage

To use this action in your GitHub workflows, you can include it as a step in your workflow YAML file. Here's an example workflow:

```yaml
name: Generate WordPress Archive

on:
  push:
    branches:
      - master

jobs:
  generate-archive:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Generating zip
        uses: rudlinkon/action-wordpress-build-zip@master
```
This workflow will execute the WordPress Build Zip action on each push to the `master` branch of your repository.

## License
This action is licensed under the MIT License.
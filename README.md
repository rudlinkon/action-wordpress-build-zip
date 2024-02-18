# WordPress Build Zip GitHub Action

This GitHub Action automates the process of generating a zip archive of a WordPress project using WP-CLI and uploads it as an artifact.

## Usage

To use this action, you will want to copy the contents of one of these examples into `.github/workflows/build-archive.yml` and push that to your repository. You are welcome to name the file something else, but it must be in that directory. The usage of `ubuntu-latest` is recommended for compatibility with required dependencies in this Action. Here's an example workflow:
### Build zip on pushes to master
```yml
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

### Build zip on pushes to any branch
```yml
name: Generate WordPress Archive
on:
  push

jobs:
  generate-archive:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Generating zip
        uses: rudlinkon/action-wordpress-build-zip@master
```
This workflow will execute the WordPress Build Zip action on each push to your repository.

### Build zip on demand
```yaml
name: Generate WordPress Archive
on:
  workflow_dispatch

jobs:
  generate-archive:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Generating zip
        uses: rudlinkon/action-wordpress-build-zip@master
```

### Build zip on demand and keep that for 1 day
```yml
name: Generate WordPress Archive
on:
  workflow_dispatch

jobs:
  generate-archive:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Generating zip
        uses: rudlinkon/action-wordpress-build-zip@master
        with:
          retention-days: 1 # Optional; defaults to 3
```

## Input Options
| Name | Type | Default | Usage |
| ----------- | -------- | ----------- | ----------- |
| `retention-days` | int | 3 | Configuring a custom artifact retention period |
| `node-version` | int | 16 | Set you custom node version |
| `install-composer` | bool | false | Composer dependencies will be installed if you enable this option |
| `npm-run-build` | bool | false | `npm run build` will be run if you enable this option |

## License
This action is licensed under the MIT License.
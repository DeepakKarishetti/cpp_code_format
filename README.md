# Format C++ code
## Dependency
- ```sudo apt-get install -y clang-format```
- ```pip3 install cmake-format```

## Setup
#### Add to git hooks (formats code when you stage/commit a file) - run this once you init in your repo to enable it
(TODO: just use git config to keep it simple and clean)
- ```cp hooks/pre-commit .git/hooks/```
- ```git config core.hooksPath .git/hooks/```

## Manual usage
### Single file
``./format.sh -f <file_name>``

### All the files in a given folder
``./format.sh -d <dir_path>``

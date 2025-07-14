# Format C++ code
## Dependency
- ```sudo apt-get install -y clang-format```
- ```pip3 install cmake-format```

## Setup
#### Add to git hooks (formats code when you stage/commit a file) - run this once you init in your repo to enable it
(TODO: just use git config to keep it simple and clean)
1. Copy the git hooks ```pre-commit``` file to the git repo root dir:
- ```cp hooks/pre-commit .git/hooks/```
2. from the repo root, run:
- ```git config core.hooksPath .git/hooks/```

## Manual usage
### Single file
``./format.sh -f <file_name>``

### All the files in a given folder
``./format.sh -d <dir_path>``

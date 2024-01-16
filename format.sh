#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "No arguments provided. Use -f <file> or -d <directory> for formatting."
    exit 1
fi

while getopts ":f:d:" opt; do
    case $opt in
        f)  # Format an individual file
            if [[ "$OPTARG" == *".h" || "$OPTARG" == *".cpp" ]]; then
                echo "Formatting C++ file: $OPTARG..."
                clang-format -i --style=file "$OPTARG"
            elif [[ "$OPTARG" == *"CMakeLists.txt" ]]; then
                echo "Formatting CMakeLists.txt file: $OPTARG..."
                cmake-format -i "$OPTARG"
            else
                echo "Invalid file: $OPTARG. Use .h, .cpp, or CMakeLists.txt."
                exit 1
            fi
            ;;
        d)  # Format all code in a given directory path
            dir="$OPTARG"
            echo "Formatting code in directory: $dir..."
            find "$dir" \( -name "*.h" -o -name "*.cpp" -o -name "CMakeLists.txt" \) -exec bash -c '
                case "$1" in
                    *.h | *.cpp)
                        echo "Formatting C++ file: $1..."
                        clang-format -i --style=file "$1"
                        ;;
                    *CMakeLists.txt)
                        echo "Formatting CMakeLists.txt file: $1..."
                        cmake-format -i "$1"
                        ;;
                esac
            ' _ {} \;
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG. Use -f <file> or -d <directory> for formatting."
            exit 1
            ;;
    esac
done

echo "Formatting complete."

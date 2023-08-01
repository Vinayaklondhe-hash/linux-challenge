#!/bin/bash

filedirloop()  #created function that will handle all scenario
{
    echo "Welcome to File Explorer"
    while true;   # if you see main script below it is checking condition that $# means argument is not there then this while will be true
    do
        echo "------------------------------------------"
        echo "Listing files & Directories under the current directory"
        ls -lh | awk '{print $5" "$9}' | sed 's/\([0-9.]\+\)K/\1KB/g; s/\([0-9.]\+\)M/\1MB/g; s/\([0-9.]\+\)G/\1GB/g'  # will display files&directories with size of each
        echo "------------------------------------------"
        echo -n "Enter a line of text (Press Enter without text to exit):"
        read userstring
	length=${#userstring}  # here we are checking no of no. of arguments passed in user string
        if [ "${length}" -eq 0 ]; then
            echo "Exiting the File Explorer. Goodbye!"
            break
    else
	    echo "Character Count: ${length}"
        fi
    done
}

# Main script
if [ $# -eq 0 ]; then
    filedirloop
else   # if there is any argument will executing script it will prompt below message
    echo "Usage: $0"
    echo "This script does not take any arguments."
    exit 1
fi


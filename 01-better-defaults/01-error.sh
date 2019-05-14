#!/bin/bash

# A non-zero exit code that a program returns counts as an error for Bash.
# In this case, we're trying to print out the readme in this directory, but we
# spelled it wrong.
echo "Printing out the README..."
echo
cat REAMDE
echo
echo "The return code from the above command: ${?}"
echo "The above cat command failed, so you would expect this script to error "
echo "out, but it doesn't"

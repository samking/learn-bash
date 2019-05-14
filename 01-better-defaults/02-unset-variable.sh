#!/bin/bash
set -e

# You can make variables and access them as defined below.
# In Bash, if you try to access a variable that's undefined, it treats it as if
# the variable held the empty string.  That means a typo could cause a hard to
# find error, as it does in the last line below.
echo "Setting a variable to the number of files in /usr/bin..."
# List each file, one per line.  This lets us count files with spaces as one
# file.
# Then, use tail to remove the first line, which lists a total, to avoid an
# off-by-one.
# Then, count the number of lines.
NUM_FILES=$(ls -l /usr/bin | tail -n +2 | wc -l)
echo "Number of files in /usr/bin: ${NUM_FILEZ}"
echo "If there wasn't a number above, that means this script silently failed!"

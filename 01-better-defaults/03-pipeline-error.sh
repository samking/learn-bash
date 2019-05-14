#!/bin/bash
set -eu

# Pipelines are a common tool to easily chain together multiple commands using
# the pipe key: |
# We saw one in the last script.  Let's change the last script so that the
# pipeline itself has an error in it:
echo "Setting a variable to the number of files in /usr/bin..."
NUM_FILES=$(ls -l /usr/bin/nonexistant-directory | tail -n +2 | wc -l)
echo "Number of files in /usr/bin: ${NUM_FILES}"
echo "Notice that that's 0 even though we have set -e!"
echo "The ls failed, but the tail and wc commands were fine, so they just "
echo "happily executed on blank input, and the script didn't crash."

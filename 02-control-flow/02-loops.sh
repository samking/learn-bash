#!/bin/bash
set -euo pipefail

# {x..y} will produce a sequence. Older versions of bash might need to use the
# seq command like:
# for i in $(seq 0 5)
# Both {0..5} and $(seq 0 5) are both inclusive.
echo "Using {} syntax"
for i in {0..5} ; do
    echo "Loop: ${i}"
done

# for loops in bash are similar to foreach loops in other languages: they work
# over any items in a list (or the output of any command), and you don't have to
# generate them using numerical sequences like above.
echo "Using numbers"
for i in 0 1 2 ; do
    echo "Loop: ${i}"
done
echo "Using arbitrary strings"
for i in you can loop with any strings ; do
    echo "Loop: ${i}"
done

# You can use the outputs of commands too
echo "Using a subshell to get text from a command"
for word in $(cat strings.txt) ; do
    echo "Loop: ${word}"
done

# while loops work as you would expect
while true ; do
    echo "Enter 'yes' to continue looping or anything else to break."
    read USER_INPUT
    if [[ ${USER_INPUT} != 'yes' ]] ; then
        break
    fi
done

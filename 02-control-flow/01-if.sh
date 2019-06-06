#!/bin/bash
set -euxo pipefail

# If statements are followed by a command that returns a 0 (true) or nonzero
# (false) exit code.
# Using the semicolon after your statement lets you put `then` on the same line.
# Otherwise, you would need to put `then` on the next line.
# A high level overview of if/else is at
# http://mywiki.wooledge.org/BashGuide/TestsAndConditionals
if ls . ; then
    echo "We were successfully able to list the files in the current directory"
fi

# You can also use else.
if ls ./non-existant-directory ; then
    echo "This shouldn't happen"
else
    echo "We were unable to list the files in a non-existant directory"
fi

# A lot of the time, you'll want to do things that are more complicated than
# that.  In those cases, you probably want to use either `[` (an alias for the
# legacy `test` command) or `[[` (a better version of `[` that is usually what
# you want).
# Documentation on `[` is at:
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
# Documentation on `[[` and the differences between `[[` and `[` is at:
# http://mywiki.wooledge.org/BashFAQ/031
# Because most folks should only ever need to use `[[`, all of the remaining
# conditions will use that style of test.  That said, `[[` supports some of the
# syntax from `[`, so the `[` documentation is still useful.
if [[ 'hello world' =~ h.*d ]] ; then
    echo "Our regular expression test worked"
fi
if [[ 1 -lt 2 ]] ; then
    echo "Math works"
fi
if [[ 11 < 2 ]] ; then
    echo "< is a string comparison character, so 11 < 2 because '11' is "
    echo "lexically before '2'"
fi
if [[ -e /bin ]] ; then
    echo "/bin is a directory"
fi
if [[ ! 'one string' == 'two string' ]] ; then
    echo "Those strings are not equal."
fi
if [[ 'one string' != 'two string' ]] ; then
    echo "You can do 'not equal' in the ways you expect."
fi

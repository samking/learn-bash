#!/bin/bash
set -euo pipefail

echo "Call this script with a few parameters, including some with spaces."

# Note that there are more special variables available in Bash than are listed
# here.  These are just some of the most common.  See
# https://www.mylinuxplace.com/bash-special-variables/ for a few more.

# $# gets you the number of parameters.
ARGC=$#
echo "There are ${ARGC} parameters passed to this script."

# You can use $1 through $9 to positional parameters.  And, if you use braces,
# you can use any ${number} to get that numbered positional parameter.
echo "The first parameter is: ${1}"

# $*, $@, "$*", and "$@" are different ways of getting you each of the
# parameters.  Usually you want "$@"
for param in "$@" ; do
    echo "Parameter: ${param}"
done

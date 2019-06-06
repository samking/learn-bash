#!/bin/bash
set -euo pipefail

echo "This script will list all executables in the current directory and "
echo "whatever directory is passed in."

# ${1} gets the first parameter passed to the script.
# ${foo:-bar} tries to get the variable foo, but defaults to bar if foo is
# undefined.  In this case, ${1:-} tries to get the parameter but defaults to
# the empty string.
# We need to get default values because we use set -u which will error out on
# undefined variables.
DIR_TO_LIST=${1:-}
if [[ ${DIR_TO_LIST} == "" ]] ; then
    echo "Pass one parameter to this script: a directory to list"
    exit 1
fi

# There are multiple syntaxes for defining functions:
#   function foo { ... }
#   foo() { ... }
# Nothing goes inside the parentheses even if they're included.  The second
# syntax is more common in modern bash.
get_executables() {
    # Note that ${1} inside a function refers to the first parameter for the
    # function, whereas ${1} outside of a function refers to the first parameter
    # passed to the script as a whole.
    local DIR=${1}
    local EXECUTABLES=$(ls -l ${DIR} | grep '^...x.*')
    local NUM_EXECUTABLES=$(echo "${EXECUTABLES}" | wc -l)
    echo "There were ${NUM_EXECUTABLES} executables in: ${DIR}"
    echo "${EXECUTABLES}"
    # Bash functions can also return a number, which will set the exit status
    # (accessible using ${?} ) to that number.  However, if you have set -e on,
    # that might also cause the script to error out.
}

get_executables .
get_executables ${DIR_TO_LIST}

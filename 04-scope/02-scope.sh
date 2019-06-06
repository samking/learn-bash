#!/bin/bash
set -euo pipefail

# Default variable scope is global.
GLOBAL="Some Variable"

global_variables() {
    echo "Global variables are accessible within functions: ${GLOBAL}"
}
global_variables

# Generally, you want to use local variables when you can because that will help
# you avoid polluting the global scope and will let you choose what information
# is shared for the purpose of modularity.
# Local variable scope in Bash is a little weird, though, as demonstrated below.
# Normally, with a recursive function like this, you would expect every
# invocation of the function to have a totally separate set of local variables,
# but that isn't quite how it works here.
local_variables() {
    local num=${num:-0}
    if [[ ${num} < 5 ]] ; then
        # $(( ... )) lets you do math.  You can also use executables like expr
        # or bc if you prefer.
        num=$((num + 1))
        echo "(before) Num: ${num}"
        local_variables
        echo "(after) Num: ${num}"
    fi
}
local_variables
echo "Local variables aren't defined outside of their function: ${num:-}"

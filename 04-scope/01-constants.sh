#!/bin/bash
set -euo pipefail

# Trying to overwrite a readonly variable will cause it to error out.
# You can use it for constants that should never change.  It can cause errors if
# you add constants in scripts that other people source, though.  For instance,
# if you put a constant in a profile.d script and someone happens to use the
# same variable name in their bashrc, it'll error out.
readonly A_CONSTANT=10
A_CONSTANT=11

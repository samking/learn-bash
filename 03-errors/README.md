You know from exercise 1 that set -euxo pipefail will make your bash scripts
fail fast whenever a command errors out (including pipelines and including unset
variables).  However, some commands are supposed to error out without crashing
the whole script.

Make scripts that demonstrate the following behavior:
- What happens when a command inside an "if" test fails?
- What happens when a command before an "or" fails?  (e.g., foo || bar)
- What happens when a command inside a function fails?  What if the function is
  called from before an "or" or from inside an "if" test?

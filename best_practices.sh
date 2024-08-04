#!/usr/bin/env bash

set -o errexit 
set -o pipefail
set -o nounset

  set -o errexit   # abort on nonzero exitstatus
  set -o nounset   # abort on unbound variable
  set -o pipefail  # don't hide errors within pipes

set -o xtrace
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

# short form
set -e
set -u

# most reliable
# Quotes help to prevent issues when variable contains spaces (for example, in filenames).
# Curly braces help with more complex situations like:
#    string interpolation: "${variable}.yml"
#    default/fallback values: "${variable:-something_else}"
#    string replacement: "${variable//from/to}".

var="var"
echo "${var}"

# constant
readonly something='immutable value'

# includes
readonly BINPATH="$(dirname "$0")"
source "${BINPATH}/../shared/some_functions"


# bash has a linter too: shellcheck.net

$ var=''
$ [ $var = '' ] && echo True
#-bash: [: =: unary operator expected
$ [ "$var" = '' ] && echo True
#True
$ [[ $var = '' ]] && echo True
#True

# Besides [[ provides the following features over [:

# [[ can do glob pattern matching:

[[ abc = a* ]]

# [[ can do regex pattern matching (Bash 3.1+):

[[ abb =~ ab+ ]]

#!/usr/bin/env bash
[..irrelevant code..]
set -x
[..relevant code..]
set +x
[..irrelevant code..]



1 # dump set -x data to a file
2 # turns on with a filename as $1
3 # turns off with no params
4 setx_output()
5 {
6     if [[ $1 ]]; then
7         exec {BASH_XTRACEFD}>>"$1"
8         set -x
9     else
10         set +x
11         unset -v BASH_XTRACEFD
12     fi
13 }

# If the script goes too fast for you, you can enable code-stepping. 
# The following code uses the DEBUG trap to inform the user about what command is about to be executed
# and wait for his confirmation do to so. Put this code in your script, at the location you wish to begin stepping:

debug_prompt () { read -p "[$BASH_SOURCE:$LINENO] $BASH_COMMAND?" _ ;}
trap 'debug_prompt "$_"' DEBUG



  # Avoid:
  rm -rf -- "${dir}"
  # Good:
  rm --recursive --force -- "${dir}"

# Don’t use:
  cd "${foo}"
  [...]
  cd ..
# but
  (
    cd "${foo}"
    [...]
  )




#When combining a sudo command with redirection, it’s important to realize that the root permissions only apply to the command, 
#not to the part after the redirection operator. An example where a script needs to write to a file that’s only writeable as root:

  # this won't work:
  sudo printf "..." > /root/some_file

  # this will:
  printf "..." | sudo tee /root/some_file > /dev/null


  error() {
    printf "${red}!!! %s${reset}\\n" "${*}" 1>&2
  }


cat <<'MSG'
  [...]
MSG

# Create functions with a meaningful name for complex tests

  # Don't do this
  if [ "$#" -ge "1" ] && [ "$1" = '-h' ] || [ "$1" = '--help' ] || [ "$1" = "-?" ]; then
    usage
    exit 0
  fi

  # Do this
  help_wanted() {
    [ "$#" -ge "1" ] && [ "$1" = '-h' ] || [ "$1" = '--help' ] || [ "$1" = "-?" ]
  }

  if help_wanted "$@"; then
    usage
    exit 0
  fi


# Cleanup code
# An idiom for tasks that need to be done before the script ends (e.g. removing temporary files, etc.). 
# The exit status of the script is the status of the last statement before the finish function.

finish() {
  result=$?
  # Your cleanup code here
  exit ${result}
}
trap finish EXIT ERR


# vault
MY_VARIABLE=$(vault kv get -field MY_FIELD PATH/TO/MY/SECRET)

echo "$MY_VARIABLE"
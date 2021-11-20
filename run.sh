
#!/usr/bin/env bash
# run.sh provides handy commands to set up your development environment, build and deploy the code, run the tests, etc.

set -euf -o pipefail
SCRIPTNAME=${BASH_SOURCE[0]}
SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SUCCESS=0
FAILURE=1

VENVDIR=$SCRIPTDIR/venv
VENV_ACTIVATE="source $VENVDIR/bin/activate"

do-help()
{
    echo
    echo "Usage: ./run.sh COMMAND [ARG...]"
    echo
    echo "See README.md for more instructions."
    echo
    echo "Build environment info:"
    echo
    echo "  OSTYPE:              $OSTYPE"
    echo "  PATH:                $PATH"
    echo "  SHELL:               $SHELL"
    echo "  PWD:                 $PWD"
    echo "  SCRIPTNAME:          $SCRIPTNAME"
    echo "  SCRIPTDIR:           $SCRIPTDIR"
    echo "  VENVDIR:             $VENVDIR"
    echo "  VENV_ACTIVATE:       $VENV_ACTIVATE"
    echo
    echo "Software version: $(git describe --match=DoNotMatchAnyTags --always --abbrev=40 --dirty)"
    echo
    echo "Date and time: $(date +%Y-%m-%d-%H%M)"
    echo
}

do-all()
{
    do-help
}

do-setup-venv()
{
    echo "$SCRIPTNAME: Creating Python virtual environment."
    python3 -m venv $VENVDIR
    (
        $VENV_ACTIVATE && pip install -r requirements.txt
    )
}

do-update-requirements()
{
    echo "$SCRIPTNAME: Updating requirements.txt file from packages currently installed in the virtual environment."
    (
        $VENV_ACTIVATE && pip freeze > requirements.txt
    )
}

do-app()
{
    echo "$SCRIPTNAME: Starting app."
    (
        $VENV_ACTIVATE && python main.py
    )
}

if [ $# -lt 1 ] ; then
    echo "$SCRIPTNAME: Error: No COMMAND given."
    exit $FAILURE
fi
cmd=$1
shift

echo "$SCRIPTNAME: Running: $cmd $@"
do-$cmd "$@"
exit $?

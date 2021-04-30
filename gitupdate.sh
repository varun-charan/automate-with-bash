#!/bin/bash

gitupdate() {                                  # Function: This function actually runs the git commands.
    echo "+==============================================================+"
    echo "|               STARTING GIT PROJECT UPLOAD....                |"
    echo "+==============================================================+"

    echo "****************************************************************"
    echo "RUNNING: git pull origin "$BRANCH"...."
    echo
    git pull origin "$BRANCH"
    echo
    echo "COMPLETE: git pull origin "$BRANCH""
    echo "****************************************************************"

    echo "****************************************************************"
    echo "RUNNING: git add -A . and git status...."
    echo
    git add -A .
    git status
    sleep 0.5
    echo
    echo "COMPLETE: git add -A . and git status"
    echo "****************************************************************"

    echo "****************************************************************"
    echo "ADDING COMMENT: "$COMMENT""
    echo
    git commit -m "$COMMENT"
    echo "****************************************************************"

    echo "****************************************************************"
    echo "RUNNING: git push origin "$BRANCH"...."
    git push origin "$BRANCH"
    echo
    echo "COMPLETE: git push origin "$BRANCH""
    echo "****************************************************************"

    sleep 0.5

    echo "+==============================================================+"
    echo "|               COMPLETED GIT PROJECT UPLOAD.                  |"
    echo "+==============================================================+"
}

usage() {                                      # Function: Print a help message.
    echo "Usage: gitupdate [ -b BRANCH ] [ -c COMMENT ]" 1>&2
}


exit_abnormal() {                              # Function: Exit with error.
  usage
  exit 1
}


BRANCH=""                                                        # Name of GIT branch to pull and push content.
COMMENT=""                                                       # Comment to be specified in `git commit` command.

while getopts ":b:c:" options; do                                # Loop: Get the next option;
                                                                 # use silent error checking;
                                                                 # options b and c take arguments.
    case "${options}" in                                         #
      b)                                                         # If the option is b,
        BRANCH=${OPTARG}                                         # set $BRANCH to specified value.
        ;;
      c)                                                         # If the option is c,
        COMMENT=${OPTARG}                                        # Set $COMMENT to specified value.
        ;;
      :)
        echo "Error: -${OPTARG} requires an argument."           # If expected argument omitted:
        exit_abnormal                                            # Exit abnormally.
        ;;
      *)
        echo "Error: Unknown error."                             # If unknown (any other) option:
        exit_abnormal                                            # Exit abnormally.
        ;;
    esac
done

if [ -z "$BRANCH" ]; then
    echo "Error: No branch is specified".
    usage
    exit
elif [ -z "$COMMENT" ]; then
    echo "Error: No comment is specified".
    usage
    exit
fi

if [ "$BRANCH" = "" ]; then                    # If $BRANCH is an empty string,
  echo "Empty branch specified!"               # let the user know they have given an empty branch name.
fi

#echo "branch='$BRANCH', comment='$COMMENT'"   # Debug print to verify this function works correctly everytime.

gitupdate                                      # Function call to run git commands.

exit 0;


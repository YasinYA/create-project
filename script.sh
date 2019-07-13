#!/bin/bash


function main() {
    # Load virtaulenvwrapper functions
    source $VIRTUAL_ENV_WRAPPER_SCRIPT

    # create the project
    create $@
}


function handle_errors() {
    if [ $1 -ne 0 ]; then
         exit 1
    fi
}

function parse_args() {
    while getopts "n:wp" opt; do
        case "${opt}" in
            n)
                name=${OPTARG}
                ;;
            w)
                work=true
                ;;
            p)
                private=true
                ;;
            *)
                usage
                ;;
        esac
    done
    shift $((OPTIND-1))
}


function help() {
    echo 'these are the valid paramas: \n -w = put the directory under the work folder, \n-p = make the repo private, \n-n = name of the directory and repo '
}

function create() {

    # check the arguments
    parse_args $@

    # Run project setup script
    if [ "$work" == true ]
    then
        python3 $SCRIPT_DIRECTORY/directory_setup.py -n $name -w
    else
        python3 $SCRIPT_DIRECTORY/directory_setup.py -n $name
    fi

    handle_errors $?

    # Base directory
    if [ "$work" == true ]
    then
        cd "$WORK_DIRECTORY/$name"
    else
        cd "$PROJECTS_DIRECTORY/$name"
    fi

    # initailize git
    echo "Initializing Git..."
    git init
    echo "Adding changes..."
    git add -A
    echo "Commiting..."
    git commit -m "Initial commit"

    # run git script
    workon createproject
    if [ "$private" == true ]
    then
        python3 $SCRIPT_DIRECTORY/github_repo.py -n $name -p
    else
        python3 $SCRIPT_DIRECTORY/github_repo.py -n $name
    fi
    deactivate

    handle_errors $?

    # add the remote repo and push it
    echo "Adding remote url..."
    git remote add origin "$GIT_SSH_URL/$name.git"
    echo "Finally pushing to remote repo..."
    git push -u origin master

    # open it in code editor
    echo "Opening Sublime..."
    subl .
}

main $@

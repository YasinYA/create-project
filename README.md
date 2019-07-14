# Create Project Script
We all know how tedious project creation process is, setting up directory and github. So I decided to create this script to save time. I divide my work and side projects into two different directories (Work, Projects), which is much cleaner then keeping them in same folder. If you to seperate them too the script has `-w` to set the base directory to your Work directory.

## Prerequisites

You need:

    * Python3.6>
    * virtualenvwrapper
    * Github Account
    * SSH access to your github


## Setup

### Step 1: Clone this repo and install the deps

`git clone git@github.com:YasinYA/create-project.git`

make virtaul enviornment and install deps

`pip install -r requirements.txt`


### Step 2: Enviornment Variables

Setup your env variables. Add these variables to your `.bashrc` or `.zshrc` depending on what shell you use.

```bash
export GIT_USERNAME='username'
export GIT_PASSWORD='password'
export GIT_SSH_URL='git@github.com:username'
export SCRIPT_DIRECTORY=full path of where you put the script
export VIRTUAL_ENV_WRAPPER_SCRIPT=full path of the virtualenvwrapper.sh
export WORK_DIRECTORY=full path of your work projects directory (optional)
export PROJECTS_DIRECTORY=full path of your side projects directory
```

### Step 3: Making command

In order to run `script.sh` from anywhere you need to make it a command.

### Step 4: Running the script

When running bash scripts. Every script starts its own `SubShell`, which is basically a child process of the parent shell(your current terminal window) and subshells can't affect parent shell. When you try to change the directory it wont change the parent. A work arround is to run your script as:

`. what_ever_you_named_your_command options`

or use alias.

### Step 4: Usage

#### Side Projects

public repo

`the_name_your_command -n project_name`

private repo

`the_name_your_command -n project_name -p`

#### Work Projects

public repo

`the_name_your_command -n project_name -w`

private repo

`the_name_your_command -n project_name -w -p`


**NOTE** I use sublime text 3 as my code editor, change that to you editor too

If you want to advance it you are welcomed!

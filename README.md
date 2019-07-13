# Create Project Script
We all know how tedicious project creation process is, setting up directory and github. So I decided to create this script to save time. I divide my work and side projects into two different directories (Work, Projects), which I think it's much cleaner then keeping them in same folder. If you to seperate them too the script has `-w` to set the base directory to your Work directory.

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

### Step 2: Edit the code

Change paths in `script.sh` to where you python scripts are.


### Step 3: Enviornment Variables

Setup your env variables. the script reads env variables to get your github username, password and git ssh url. Add these three lines to your `.bashrc` or `.zshrc` depending on what shell you use.

```bash
export GIT_USERNAME='username'
export GIT_PASSWORD='password'
export GIT_SSH_URL='git@github.com:username'
```

### Step 4: Making command

In order to run `script.sh` from anywhere you need to make it a command.

### Step 5: Running the script

When running bash scripts. Every script starts its own `SubShell`, which is basically a child process of the parent shell(your current terminal window) and subshells can't affect parent shell. When you try to change the directory it wont change the parent. A work arround is to run your script as:

`. what_ever_you_named_your_command options`

or use alias.

**NOTE** I use sublime text 3 as my code editor, change that to you editor too

If you want to advance it you are welcomed!

#!/usr/bin/env python3
"""gitremote-token
If you have a 2factor auth on your github acc, you will need to add
a personal token to youre remote origin if you are pushing from terminal.
Tested on: Linux
"""
import subprocess
import os
import re
import json
import sys
#COLORS
CYA = "\033[1;36m"
GRE = "\033[0;32m"
RED = "\033[1;31m"
R = "\033[0;0m"
#GLOBALS
HOME = os.path.expanduser('~')
ABSPATH = os.path.dirname(os.path.realpath(__file__))
GITCONFIG_FILE = os.path.join(HOME, ".gitconfig")
SETTINGS_FILE = os.path.join(ABSPATH, ".gitremotetoken.json")
DEFAULT_ORIGIN = "https://github.com/{}/{}"
#MESSAGES
M_GREETING = f"{GRE}Adding token to git remote origin:{R}"
M_GIT_REPO_NAME = f"{CYA}What is the repo's name?{R}\n > "
M_GIT_REPO_USER = f"{CYA}What is the repo's user?{R}\n > "
M_GREETING_SETUP = f"{GRE}Setting up Gitremotetoken:{R}"
M_PASSFOLDER = f" > {CYA}What is your pass folder name?{R}\n"
M_SUC_GIT = f" > {GRE}Found git user:{R}"
M_SUC_SETUP = f" > {GRE}Created settings file at {SETTINGS_FILE}{R}"
M_SUC = f" > {GRE}Successfully added Github access token to remote origin{R}"
M_REMOVE_ORIGIN = f" > {GRE}Removed git remote origin{R}"
M_ERR_GITCONFIG = f" > {RED}Error: Could not find ~/.gitconfig{R}"
M_ERR_FATAL = f" > {RED}Error: Line "


def get_git_user():
    if not os.path.isfile(GITCONFIG_FILE):
        print(M_ERR_GITCONFIG)
        sys.exit(1)
    with open(GITCONFIG_FILE, "r") as f:
        query = re.search("name = (.+?)$", f.read())
        name = query.group(1)
        return name
    
def setup():
    if not os.path.isfile(SETTINGS_FILE):
        print(M_GREETING_SETUP)
        passfolder = input(M_PASSFOLDER)
        gituser = get_git_user()
        if not gituser:
            print(M_ERR_FATAL + f"52{R}")
            sys.exit(1)
        settings = {
            "gituser": gituser,
            "passfolder": passfolder
        }
        with open(SETTINGS_FILE, "w") as f:
            json.dump(settings, f)
        return settings

def check_system():
    if "linux" not in sys.platform:
        sys.exit(1)
    return True

def run_pass(passfolder):
    """Currently supports single passwords, not multi"""
    proc = subprocess.Popen(f"pass {passfolder}", shell=True,
                            stdout=subprocess.PIPE)
    output = proc.communicate()[0]
    result = output.decode("utf-8").strip().split()
    if len(result) > 0:
        del proc
        return result[0]

def check_origin(user):
    proc = subprocess.Popen(f"git remote -v", shell=True,
                            stdout=subprocess.PIPE)
    output = proc.communicate()[0]
    result = output.decode("utf-8").strip().split()
    if result == []:
        repouser = input(M_GIT_REPO_USER)
        repo = input(M_GIT_REPO_NAME)
    else:
        remote = result[1].split("/")
        repo = remote[-1]
        repouser = remote[-2]
    info = {
        "repouser": repouser,
        "repo": repo
    }
    if result != [] and result[0] == "origin":
        comm = "git remote remove origin"
        proc = subprocess.Popen(comm, shell=True,
                                stdout=subprocess.PIPE)
        output = proc.communicate()[0]
        code = proc.returncode
        if code == 0:
            print(M_REMOVE_ORIGIN)
    return info

def edit_origin(settings):
    user = settings["gituser"]
    info = check_origin(user)
    repouser = info["repouser"]
    repo = info["repo"]
    token = run_pass(settings["passfolder"])
    comm = f"git remote add origin https://{user}:{token}@github.com/{repouser}/{repo}"
    proc = subprocess.Popen(comm, shell=True, stdout=subprocess.PIPE)
    output = proc.communicate()[0]
    code = proc.returncode
    if code != 0:
        message = output.decode("utf-8")
        print("Error Output:")
        print(message)
    else:
        print(M_SUC)
    del token

def main():
    check_system()
    settings = setup()
    if settings:
        exit(0)
    else:
        with open(SETTINGS_FILE, "r") as f:
            settings = json.load(f)
    edit_origin(settings)

if __name__ == "__main__":
    main()

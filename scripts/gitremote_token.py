#!/usr/bin/env python3
"""gitremote-token

If you have a 2factor auth on your github acc, you will need to add
a personal token to youre remote origins if you are pushing from terminal.

This script helps automate the process of typing that long remote add command.

Args:
    user (str): argv[1]
    repo_name (str)
"""
import passpy
import subprocess
import os
import json
from sys import argv
import sys
ABSPATH = os.path.dirname(os.path.realpath(__file__))
FILENAME = os.path.join(ABSPATH, ".gitremotetoken.json")
FOLDER_KEY = "gitremotetoken"


def get_folder_name():
    data = None
    if not os.path.isfile(FILENAME):
        pf = input("What is the name of your pass folder for your git 2FA token?\n")
        if "/" not in pf:
            print("Try again and enter in the pass folder name for your git 2FA token.")
            quit()
        with open(FILENAME, "w") as f:
            data = {FOLDER_KEY: pf}
            json.dump(data, f)
    else:
        with open(FILENAME, "r") as f:
            data = json.load(f)
    return data

def create_origin(key=None, user=None, repo_name=None):
    if ".git" in repo_name:
        repo_name = repo_name.replace(".git", "")
    os.system("git remote add origin https://{}:{}@github.com/{}/{}.git".format(user, key, user, repo_name))
    del key
    pass

if __name__ == "__main__":
    if len(argv) != 3:
        print("Needs 2 arguments: GITHUB_USER, GITHUB_REPO")
        print("ex. https://github.com/user-name/repo-name.git")
        print("gitremotetoken user-name repo-name")
    else:
        print(sys.version)
        user = argv[1]
        repo_name = argv[2]
        # Get's pass folder name from json file, then runs pass with it
        key = passpy.run_pass(get_folder_name()[FOLDER_KEY])
        create_origin(key, user, repo_name)
        del key

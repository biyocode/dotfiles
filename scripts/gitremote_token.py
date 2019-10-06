#!/usr/bin/env python3
"""gitremote-token

If you have a 2factor auth on your github acc, you will need to add
a personal token to youre remote origins if you are pushing from terminal.

This script helps automate the process of typing that long remote add command.

Args:
    user (str): argv[1]
    repo_name (str)
"""
import settings
import passpy
import subprocess
import os
from sys import argv


def create_origin(key=None, user=None, repo_name=None):
    os.system("git remote add origin https://{}:{}@github.com/{}/{}.git".format(user, key, user, repo_name))
    del key
    pass

if __name__ == "__main__":
    if len(argv) != 3:
        print("Needs 2 arguments: GITHUB_USER, GITHUB_REPO")
    else:
        user = argv[1]
        repo_name = argv[2]
        key = passpy.run_pass(settings.PASS_GITREMOTE)
        create_origin(key, user, repo_name)
        del key

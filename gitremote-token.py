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
import subprocess
import os
from sys import argv

def run_pass(pass_target=None, multi=None):
    """Runs the package 'pass' on your linux machine

    Not on multi-mode by default, if multi == 0, then it is on.

    Args:
        pass_target (str): The folder/application in your Password Store
        multi (int): 0 or None

    Returns:
        output_string(str): Your password after decryption via passphrase
    """
    if pass_target == None or pass_target == []:
        print("\n[USAGE]:\n\n[COMMAND] [FOLDER]/[APPLICATION]\n")
        print("Please enter your folder/application.\n")
        exit()
    if type(pass_target) is list:
        res = pass_target[0]
    if type(pass_target) is str:
        res = pass_target

    proc = subprocess.Popen("pass {}".format(res),
                            shell=True,
                            stdout=subprocess.PIPE)
    output = proc.communicate()[0]
    output_string = output.decode("utf-8")
    if multi != None:
        return outout_string.strip().split()
    else:
        return output_string.strip()

def create_origin(key=None, user=None, repo_name=None):
    os.system("git remote add origin https://{}:{}@github.com/{}/{}.git".format(user, key, user, repo_name))
    del key
    pass

if __name__ == "__main__":
    if len(argv) != 3:
        print("Needs 2 arguments: GITHUB_USER, GITHUB_REPO")
    else:
        user = argv[1]
        repo_name = args[2]
        key = run_pass(settings.PASS_GITREMOTE)
        create_origin(key, user, repo_name)
        del key

#!/usr/bin/env python3
"""Edit global variables when new script/alias is added."""
import os
from os import path
import re
import sys
import time
HOME = os.path.expanduser("~")
ABSPATH = os.path.dirname(os.path.realpath(__file__))
PARTS_FOLDER = os.path.join(ABSPATH, "parts")
SCRIPTS_FOLDER = os.path.join(ABSPATH, "scripts")
CUSTOM_FOLDER = os.path.join(HOME, ".custom_scripts")
BASHRC = os.path.join(HOME, ".bashrc")
BASHRC_OLD = os.path.join(HOME, ".bashrc_backups", ".bashrc_old")
BASHRC_NEW = os.path.join(HOME, ".bashrc_new")
ALLPARTS = {"qol_bashrc": os.path.join(PARTS_FOLDER, "qol_bashrc"),
            "py_bashrc": os.path.join(PARTS_FOLDER, "py_bashrc"),}
# Key needs to be dotfile name
ALLDOTFILES = {".vimrc": os.path.join(ABSPATH, ".vimrc")}
ALLSCRIPTS = {"gitremotetoken": {"p": os.path.join(SCRIPTS_FOLDER, "gitremote_token.py"), "f": "python"}}
ALLRUNSCRIPTS = {"vimplug": os.path.join(SCRIPTS_FOLDER, "vim_plug_setup")}


def folder_setup():
    if not os.path.exists(CUSTOM_FOLDER):
        os.mkdir(CUSTOM_FOLDER)
    if not os.path.exists(os.path.join(HOME, ".bashrc_backups")):
        os.mkdir(os.path.join(HOME, ".bashrc_backups"))

def clear_bashrc(filename):
    """Clears any matching aliases in current bashrc"""
    checker = set()
    with open(filename, "r") as f:
        lines = f.readlines()
        for line in lines:
            item = re.search(r"alias (.+?)=", line)
            if item:
                checker.add(item[0])
    print(f"> Backing up {BASHRC} into {BASHRC_OLD}...")
    timestamp = str(time.time())
    os.system(f"cp {BASHRC} {BASHRC_OLD}.{timestamp}")
    with open(BASHRC, "r") as f:
        lines = f.readlines()
        res = lines.copy()
        for idx in range(len(lines)):
            alias = re.search(r"alias (.+?)=", lines[idx])
            if alias:
                if alias[0] in checker:
                    print(f"> Removing line: {res[res.index(lines[idx])]}")
                    del res[res.index(lines[idx])]
        print(f"> Creating new {BASHRC}...")
        with open(BASHRC_NEW, "w") as f1:
            for line in res:
                f1.write(line)
    print(f"> Removing {BASHRC}...")
    os.system(f"rm {BASHRC}")
    os.system(f"mv {BASHRC_NEW} {BASHRC}")

def insert_bash_parts(name, path):
    clear_bashrc(path)
    print(f"> Inserting into {BASHRC}...")
    print(f">   -> From: {path}")
    os.system(f"sed '2,100!d' {path} >> {BASHRC}")

def insert_scripts(name, data):
    print(f"> Creating script alias: {name}...")
    alias = f"alias {name}='{data['f']} {data['p']}'"
    temp_path = os.path.join(SCRIPTS_FOLDER, name)
    with open(temp_path, "w") as f:
        f.write(alias)
    clear_bashrc(temp_path)
    print(f"> Checking if {name} alias exists...")
    os.system(f"rm {temp_path}")
    os.system(f"echo '{alias}' >> {BASHRC}")

def run_scripts(path):
    os.system("./{path}")

def insert_dotfiles(name, path):
    to_path = input("> What is the path to the dotfile?\n")
    if os.path.isfile(to_path):
        print("> Path cannot be a file, try again.")
        quit()
    else:
        to_path = os.path.join(to_path, name)
        print("> Creating {name}...")
        os.system(f"yes | cp {path} {to_path}")

def list_all_commands():
    full_list = []
    full_list.append(list(ALLPARTS))
    full_list.append(list(ALLDOTFILES))
    full_list.append(list(ALLSCRIPTS))
    full_list.append(list(ALLRUNSCRIPTS))
    for part in full_list:
        print(">   ", end="")
        print("\t".join(part))
    

if __name__ == "__main__":
    folder_setup()
    try:
        name = sys.argv[1:][0]
        print(f"> Selected: {name}")
    except IndexError:
        print(f"> [ERROR] Please enter a command. Choose from this list:")
        list_all_commands()
        quit()
    parts_path = ALLPARTS.get(name, None)
    scripts_data = ALLSCRIPTS.get(name, None)
    run_scripts_path = ALLRUNSCRIPTS.get(name, None)
    dotfiles_path = ALLDOTFILES.get(name, None)
    if parts_path:
        insert_bash_parts(name, parts_path)
    elif scripts_data:
        insert_scripts(name, scripts_data)
    elif run_scripts_path:
        run_scripts(run_scripts_path)
    elif dotfiles_path:
        insert_dotfiles(name, dotfiles_path)
    else:
        print(f"> [ERROR] {name} not found. Choose from this list:")
        list_all_commands()
        quit()
    print("> Refreshing shell...")
    os.system("exec $SHELL")

# My Dotfiles and Scripts on Linux

## Description

A collection of the dotfiles and scripts I use.

---

## Setup :wrench:

Run `setup.py` to insert specific parts of dotfiles or scripts.

## Commands

List of avaliable commands:

Dotfiles:
  * `qol_bashrc`
  * `py_bashrc`
  * `vim`

Scripts:
  * `gitremotetoken`

Run Scripts:
  * `vimplug`

---

## Repository Contents :file_folder:

### Notable Scripts

* [passpy.py](./scripts/passpy.py)
  * Import this into any project that needs to utilize `pass`

* [gitremote_token.py](./scripts/gitremote_token.py)
  * Creates a remote origin with your personal token (2-factor bypass) from github.
  * Relies on `passpy.py`, make sure that is setup.
  * Usage: `gitremote_alias GITHUB_USER GITHUB_REPO`
  
* [prettyifyjson.py](./scripts/prettyifyjson.py)
  * For Windows machine, check prettyjson in `bashrc` for Linux/Mac.
  * Prettifys a json file without any formatting.
  * Usage: `prettifyjson_alias TARGET_FILE`

### Notable Bashrc Functions

* [createpy](./bashrc#L24)
  * Creates and enters a Python3 file with the shebang and makes it executable.
  * Usage: `createpy FILE_NAME`
  * Can enter a file name with or without the `.py` extension.

* [gcomm](./bashrc#L11)
  * Lets you use `git commit -m "MESSAGE"` without needing the parenthesis.
  * Usage: `gcomm updated readme`

* [prettyjson](./bashrc#L46)
  * Prettifys a json file without any formatting.
  * Usage: `prettyjson TARGET_FILE OUTPUT_FILE`
  
* [fsize](./bashrc#L18)
  * Checks the size of a file or folder.
  * Usage: `fsize FILE/FOLDER_NAME`

### Notable Bashrc Alias/Settings

* [ux](./bashrc#83)
  * Adds executable permission to a file
  * Usage: `ux FILENAME`
  
* [Bash auto-tab complete behavior](./bashrc#L91)
  * Auto-suggests when tabbing infinitely
---

## Author
* **Derrick Gee** - [kai-dg](https://github.com/kai-dg)

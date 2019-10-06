<h1 align="center">My Dotfiles and Scripts on Linux</h1>
<p align="center">
  <img src="https://images.unsplash.com/photo-1555532538-dcdbd01d373d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1131&q=80" height=450px>
</p>

## Description

A collection of the dotfiles and scripts I use.

---

## Setup :wrench:

### Vim Plugins

* Run `./scripts/vim_plug_setup` from root of folder.

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

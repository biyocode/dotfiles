<h1 align="center">My Dotfiles and Scripts on Linux</h1>
<p align="center">
  <img src="https://images.unsplash.com/photo-1555532538-dcdbd01d373d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1131&q=80" height=450px>
</p>

## Description

A collection of the dotfiles and scripts I use.

---

## Repository Contents :file_folder:

### Scripts

* [passpy.py](./scripts/passpy.py)
  * Copy this into any project that needs to utilize `pass`

* [gitremote-token.py](./scripts/gitremote-token.py)
  * Creates a remote origin with your personal token (2-factor bypass) from github.
  * Usage: `gitremote_alias GITHUB_USER GITHUB_REPO`
  * Relies on `passpy.py`, make sure that is setup.

### Bashrc Scripts

* [createpy](./bashrc)
  * Creates and enters a Python3 file with the shebang and makes it executable.
  * Usage: `createpy FILE_NAME`
  * Can enter a file name with or without the `.py` extension.

* [gcomm](./bashrc)
  * Lets you use `git commit -m "MESSAGE"` without needing the parenthesis.
  * Usage: `gcomm updated readme`

* [fsize](./bashrc)
  * Checks the size of a file or folder.
  * Usage: `fsize FILE/FOLDER_NAME`

---

## Author
* **Derrick Gee** - [kai-dg](https://github.com/kai-dg)

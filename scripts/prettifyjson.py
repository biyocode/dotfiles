#!/usr/bin/env python3
"""Indents unformatted json files.

Created for Windows users without a .bashrc file.
If Linux/Mac, check the bashrc for `python -m json.tools` function instead.
"""
import json
import sys


def prettify_json(filename):
    with open(filename, "r") as f:
        data = json.load(f)
        filename_ext_test = set(filename)
        if "." not in filename_ext_test:
            filename += ".json"
        with open(f"formatted_{filename}", "w") as w:
            w.write(json.dumps(data, indent=4, sort_keys=True))
            print(f"Created formatted_{filename}")

if __name__ == "__main__":
    args = sys.argv[1:]
    if args == []:
        print("USAGE: COMMAND [FILE_NAME]")
        quit()

    filename = args[0]
    prettify_json(filename)

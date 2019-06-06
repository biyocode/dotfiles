#!/usr/bin/env python3
import subprocess


def run_pass(pass_target=None):
    """run_pass

    Args:
        pass_target (str): The folder/application in your Password Store.

    Returns:
        result (str) or (list): Your password after decryption via passphrase.
    """
    result = None
    if pass_target and pass_target != []:
        proc = subprocess.Popen("pass {}".format(pass_target),
                               shell=True,
                               stdout=subprocess.PIPE)
        output = proc.communicate()[0]
        result = output.decode("utf-8").strip().split()
    if result and len(result) == 1:
        return result[0]
    else:
        return result

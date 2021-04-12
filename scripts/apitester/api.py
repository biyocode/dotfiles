#!/usr/bin/env python3
"""to future me:
make way to edit profile keys in a simple way. thx
"""
import requests
import sys
import g
from profile_data import DATA


def lister(*args, **kwargs):
    for name, v in DATA.items():
        print(f"{g.CY}{name} - {v['url']}{g.R}")

def check_param(args):
    if "-p" in args:
        args.remove("-p")
        profile = DATA[args[0]]
        params = profile["params"]
    if "-d" in args: 
        args.remove("-d")
        data = True
    profile = DATA[args[0]]
    url = profile["url"]
    body = profile["body"]
    headers = profile["headers"]
    params = None
    data = False
    res = {
        "url": url,
        "body": body,
        "headers": headers,
        "params": params,
        "data": data
    }
    return res

def format_time(req):
    seconds = req.elapsed.total_seconds()
    if seconds < 1:
        ms = f"{seconds*1000:.2f}ms"
        return ms
    s = f"{seconds:.2f}s"
    return s

def result(req, d):
    print(f"{g.CY}STATUS:{g.R}")
    elap = format_time(req)
    if req.status_code == 200:
        print(f"{g.GR}{req.request.method} {req.status_code} - {elap}{g.R}")
    else:
        print(f"{g.RE}{req.request.method} {req.status_code} - {elap}{g.R}")
    print(f"{g.CY}URL:{g.R}")
    print(f"{d['url']}")
    print(f"{g.CY}HEADERS:{g.R}")
    print(f"{d['headers']}")
    if d["body"] != {}:
        print(f"{g.CY}BODY:{g.R}")
        print(f"{d['body']}")
    if d["params"]:
        print(f"{g.CY}PARAMS:{g.R}")
        print(f"{d['params']}")
    print(f"\n{g.YE}Response:{g.R}")
    print(f"{req.content}")

def post(args):
    d = check_param(args)
    try:
        if d["params"] and d["data"]:
            req = requests.post(d["url"], headers=d["headers"], data=d["body"], params=d["params"])
        elif d["params"]:
            req = requests.post(d["url"], headers=d["headers"], json=d["body"], params=d["params"])
        elif d["data"]:
            req = requests.post(d["url"], headers=d["headers"], data=d["body"])
        else:
            req = requests.post(d["url"], headers=d["headers"], json=d["body"])
        result(req, d)
    except Exception as e:
        print(f"{g.RE}{e}{g.R}")

def get(args):
    d = check_param(args)
    try:
        if d["params"]:
            req = requests.get(d["url"], headers=d["headers"], params=d["params"])
        else:
            req = requests.get(d["url"], headers=d["headers"])
        result(req, d)
    except Exception as e:
        print(f"{g.RE}{e}{g.R}")

def helpme():
    print(f"{g.YE}Use {g.CY}list{g.R} {g.YE}to see your endpoints{g.R}")
    print(f"{g.YE}Use {g.CY}get|post{g.R} {g.YE}to make a request{g.R}")
    print(f"{g.YE} - Opts: {g.CY}-p{g.R}{g.YE} (params){g.R}")
    print(f"{g.YE} - Opts: {g.CY}-d{g.R}{g.YE} (data){g.R}")
    sys.exit(1)

def parse_my_args():
    funcs = {
        "list": lister,
        "get": get,
        "post": post
    }
    args = sys.argv[1:]
    if len(args) == 0:
        helpme()
    command = args[0]
    args.remove(command)
    foo = funcs.get(command, None)
    if not foo:
        print(f"{g.RE}{command} is not a command.{g.R}")
        helpme()
    foo(args)
    
if __name__ == "__main__":
    parse_my_args()

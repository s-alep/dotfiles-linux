#!/usr/sbin/env python
import subprocess
import os
import sys

url = subprocess.run(['git', 'remote', 'get-url', 'origin'],capture_output=True, cwd=os.getcwd() , encoding='utf-8').stdout
if not url:
    sys.exit()
if '@' in url:
    url = url.split('@')[1]
    url = url.replace(':', '/')

subprocess.run(["brave", url])






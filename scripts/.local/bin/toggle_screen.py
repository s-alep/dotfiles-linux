#!/usr/bin/env python

import subprocess
import os
import sys
import json

output_string = subprocess.run(['niri', 'msg', '-j', 'outputs'],capture_output=True, cwd=os.getcwd() , encoding='utf-8').stdout
if not output_string:
    sys.exit()
jason = json.loads(output_string)

if not 'DP-1' in jason:
    sys.exit()
current_mode = jason['DP-1']['current_mode']

if current_mode is None:
    print(234)
    subprocess.run(["niri", "msg", "output", "DP-1", "on"])
else:
    print(123)
    subprocess.run(["niri", "msg", "output", "DP-1", "off"])




#!/usr/bin/env python

import subprocess
import os
import sys

output = subprocess.run("hyprctl activewindow | rg monitor\\:", shell=True, capture_output=True, text=True).stdout
id = int(output.split(': ').pop().split(',')[0])

output = subprocess.run("hyprctl activewindow | rg size\\:", shell=True, capture_output=True, text=True).stdout
sizes = output.split(': ').pop().split(',')
current_width = int(sizes[0])
height =int(sizes[1]) 

import json

result = subprocess.run(["hyprctl", "-j", "monitors"], capture_output=True, text=True)
data = json.loads(result.stdout)
monitors = { int(m['id']) : [int(m['width']), int(m['height'])] for m in data}
new_width = 0

if current_width == monitors[id][0]:
    print(1)
    new_width = monitors[id][0]
elif current_width == monitors[id][0]//2:
    print(2)
    new_width = monitors[id][0]*2//3
elif current_width == monitors[id][0]*2//3:
    print(3)
    new_width = monitors[id][0]//3
elif current_width == monitors[id][0]//3:
    print(4)
    new_width = monitors[id][0]//2
else:
    print(5)
    new_width = monitors[id][0]//2
print(current_width)
print(new_width, height)
command = f"hyprctl dispatch resizeactive exact {new_width} {height}"
print(command)
subprocess.run(command, shell=True)

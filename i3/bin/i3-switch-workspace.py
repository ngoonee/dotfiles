#!/usr/bin/env python3
import i3ipc
import sys
from time import sleep

if len(sys.argv) == 1:
    print("Please call this script with one numeric argument")
    exit()

called_workspace = sys.argv[1]

conn = i3ipc.Connection()

outputs = conn.get_outputs()

workspaces = conn.get_workspaces()

for i in filter(lambda o: o.active, outputs):
    print(i)

for i in filter(lambda w: w.name == called_workspace, workspaces):
    called_output = i.output
    print(called_output)

for i in filter(lambda w: w.focused, workspaces):
    current_output = i.output
    print(current_output)

if 'called_output' not in locals():
    conn.command('workspace ' + called_workspace)
elif called_output == current_output:
    conn.command('workspace ' + called_workspace)
else:
    conn.command('workspace ' + called_workspace)
    conn.command('move workspace to output ' + current_output)
    sleep(0.001) # Short delay required, if not it'll change focus to called_output
    conn.command('focus output ' + current_output)

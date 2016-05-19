#!/usr/bin/env python3

import i3ipc
conn = i3ipc.Connection()

outputs = conn.get_outputs()
workspaces = conn.get_workspaces()

for i in filter(lambda w:w.visible, workspaces):
    conn.command('workspace ' + i.name)
    conn.command('move workspace to output left')

conn.command('workspace ' + list(filter(lambda w:w.focused, workspaces))[0].name)

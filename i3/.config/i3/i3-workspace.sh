#!/bin/bash

action="$1"
workspace="$2"

#focused_workspace=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused).name')

#active_postfix=${focused_workspace: -1}

focused_output=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused).output')

if  [[ "$focused_output" == "eDP1" ]];
then
    active_postfix=a
elif  [[ "$focused_output" == "DP1" ]];
then
    active_postfix=b
elif  [[ "$focused_output" == "DP2" ]];
then
    active_postfix=c
elif  [[ "$focused_output" == "VIRTUAL1" ]];
then
    active_postfix=d
elif  [[ "$focused_output" == "DVI-D-0" ]];
then
    active_postfix=a
elif  [[ "$focused_output" == "HDMI-0" ]];
then
    active_postfix=b
elif  [[ "$focused_output" == "DP-0" ]];
then
    active_postfix=c
fi

target_workspace=${workspace}${active_postfix}
echo $active_postfix
echo $target_workspace

if [[ "$action" == "move" ]]; 
then
    i3-msg "move container to workspace $target_workspace"; sleep 0.1; i3-msg "workspace $target_workspace; focus output $focused_output"
else
    i3-msg "workspace $target_workspace"; sleep 0.1; i3-msg "focus output $focused_output"
fi

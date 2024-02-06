#!/usr/bin/env sh

workspaces() {
    monitor="$1"
    workspaces=7
    active_workspace=$(hyprctl monitors | grep "active workspace" | awk '{print $3}')
    echo -n "(box	:class \"workspace\"	:orientation \"h\" :space-evenly \"false\" "
    for i in $(seq 1 $workspaces); do
        if [ $i -eq $active_workspace ]; then
            icon=""
        else
            icon=""
        fi
        echo -n "(button :onclick \"hyprctl dispatch workspace $((i))\" :tooltip \"Workspace $((i))\" :class \"work_focus\" \"$icon\") "
    done
    echo ")"
}

workspaces $1

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do 
    workspaces $1
done

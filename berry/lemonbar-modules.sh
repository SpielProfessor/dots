#!/bin/bash
###################
# L E M O N B A R #
#  Modules index  #
###################


# workspaces module for the berry window manager
workspaces() {
     # Get the active workspace or desktop number
    active_workspace=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')

    # Get the total number of workspaces (desktops)
    total_workspaces=$(xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}')

    # Build the output for lemonbar
    output=""
    for ((i=0; i<total_workspaces; i++)); do
        # the index to display, i+1
        declare -i DISPLAY_i=$i+1
        if [[ "$i" == "$active_workspace" ]]; then
          output+="%{B#d3c6aa}%{F#1e2326} $DISPLAY_i %{B-}%{F-} "  # Highlight active workspace
        else
            output+=" %{A:berryc switch_workspace $i:}$DISPLAY_i%{A}  "
        fi
    done

    echo "$output"
}

# seperator
sep() {
  echo " | "
}

# current window name
cwin() {
  xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | xargs -I {} xprop -id {} WM_NAME | awk -F' = ' '{print $2}' | tr -d '"'
}

# jgmenu
menu() {
  echo "%{A:jgmenu_run:} Menu %{A}"
}

# clock module
clock() {
  date +"%a, %d.%m.%y, %H:%M:%S"
}


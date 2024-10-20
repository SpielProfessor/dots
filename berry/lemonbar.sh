#!/bin/bash
###################
# L E M O N B A R #
#  Configuration  #
###################

# include lemonbar modules
source ~/.config/berry/lemonbar-modules.sh

while true; do
  left="$(workspaces)$(sep)$(cwin)"
  centre=""
  right="$(clock)"

  # echo final output
  echo "%{l}  $left%{c}$centre%{r}$right "
  sleep 0.2
done

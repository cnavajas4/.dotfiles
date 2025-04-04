#!/usr/bin/env bash

# Define search directories
search_dirs=("$HOME/.dotfiles" "$HOME/.config")
search_dirs+=($(find "$HOME/dev" -mindepth 1 -maxdepth 1 -type d 2>/dev/null))
 
 # Select a directory
 selected_dir=$(
     find "${search_dirs[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null |
         fzf --color fg:dim,fg+:regular \
         --list-border --input-border --input-label '  tmux sessionizer — vim ' \
         --preview '$HOME/.local/scripts/fzf-preview-01.sh {}' \
         --preview-window 'bottom:30%' --preview-label ' files '
 )
 [[ -z $selected_dir || ! -d $selected_dir ]] && exit 1
 
 cd "$selected_dir" || return 1

 # Generate a name for the tmux session path-based 
 session_name=$(basename "$selected_dir" | tr . _)

 # Handle tmux session
 if tmux has-session -t=$session_name 2>/dev/null; then
     [[ -z $TMUX ]] && tmux attach-session -t $session_name || tmux switch-client -t $session_name
 else
     tmux new-session -d -s $session_name -c "$selected_dir"
     tmux send-keys -t $session_name:0 "nvim ." C-m
     [[ -z $TMUX ]] && tmux attach-session -t $session_name || tmux switch-client -t $session_name
 fi

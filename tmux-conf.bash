#!/usr/bin/env bash
#
# Setup tmux.

echo "
  # Start window index at 1
  set -g base-index 1
  
  # Start pane index at 1
  set -g pane-base-index 1
  
  # Re-number windows when one is closed 
  #set -g number-windows on
  
  # Remapping prefix 
  set-option -g prefix C-s # setting prefix from C-b to C-s
  bind-key C-s send-prefix # ensure that we can send Ctrl-s to other apps or the shell
  
  # Split panel with the current path 
  unbind %
  bind '\' split-window -h -c '#{pane_current_path}'
  
  # Vim style pane selection
  bind h select-pane -L
  bind j select-pane -D
  bind k select-pane -U
  bind l select-pane -R
  
  # Use Alt-vim keys without prefix key to switch panes
  bind -n M-h select-pane -L
  bind -n M-j select-pane -D
  bind -n M-k select-pane -U
  bind -n M-l select-pane -R
  
  ## Captrure current tmux buffer and copy it to systerm clipboard with prefix + 'Ctrl + c'
  bind C-c run "tmux save-buffer - | xclip -i -set clipboard"
  
  # Optional - paste from systerm clipboard to tmux session with prefix " 'Ctrl + C'
  #bind C-v run "tmux set-buffer "$(xclip -o set clipboard)"; tmux paste-buffer
  
  #copy and paste vim style
  
  ## Enable vi-copy-mode
  setw -g mode-keys vi 
  
  # Turn off mouse and use vim keys for navigations
  # turn this on if you want to use touchpad or mouse to scroll through terminal
  setw -g mouse off 
  
  ## changing the key to enter copy mode from `[` to `ESC`
  #unbind [
  #bind Escape copy-mode
  
  ## unbind p and set it to paste from buffer
  unbind p
  bind p paste-buffer
  
  ## set keys for visual mode (v) and yank/copy (y)
  bind-key -Tcopy-mode-vi 'v' send -X begin-selection
  bind-key -Tcopy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
  
  #Automatically set the window title
  set-window-option -g automatic-rename off
  
  # activity notifications
  setw -g monitor-activity on
  setw -g visual-activity on
  
  # Improve terminal colors
  #set -g default-terminal "screen-256color"
  #set -ga terminal-overrides ",xterm-256color:Tc"
  
  # increase scrollback buffer to 10000
  set -g history-limit 10000
  
  # List of plugins
  set -g @plugin 'tmux-plugins/tpm'
  set -g @plugin 'tmux-plugins/tmux-sensible'
  
  # Other examples:
  # set -g @plugin 'github_username/plugin_name'
  # set -g @plugin 'github_username/plugin_name#branch'
  # set -g @plugin 'git@github.com:user/plugin'
  # set -g @plugin 'git@bitbucket.com:user/plugin'
  
  set -g @plugin 'dracula/tmux'
  
  # Set 256 colors
  set -s default-terminal 'tmux-256color'
  
  # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
  run '~/.tmux/plugins/tpm/tpm'
  " >> ~/.tmux.conf

echo "tmux updated"

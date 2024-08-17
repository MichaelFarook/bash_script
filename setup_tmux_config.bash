#!/usr/bin/env bash
#################################################################
# Setup .tmux.conf
#################################################################

# Append tmux configuration if not already present
if ! grep -q "set -g base-index 1" ~/.tmux.conf; then
  cat <<EOF >> ~/.tmux.conf

  # Start window index at 1
  set -g base-index 1
  
  # Start pane index at 1
  set -g pane-base-index 1
  
  # Re-number windows when one is closed 
  # set -g number-windows on
  
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
  
  # Capture current tmux buffer and copy it to system clipboard with prefix + 'Ctrl + c'
  bind C-c run "tmux save-buffer - | xclip -i -selection clipboard"
  
  # Optional - paste from system clipboard to tmux session with prefix + 'Ctrl + v'
  # bind C-v run "tmux set-buffer \"\$(xclip -o -selection clipboard)\"; tmux paste-buffer"
  
  # Copy and paste vim style
  
  # Enable vi-copy-mode
  setw -g mode-keys vi 
  
  # Turn off mouse and use vim keys for navigation
  setw -g mouse off 
  
  # Changing the key to enter copy mode from \`[\` to \`ESC\`
  # unbind [
  # bind Escape copy-mode
  
  # Unbind p and set it to paste from buffer
  unbind p
  bind p paste-buffer
  
  # Set keys for visual mode (v) and yank/copy (y)
  bind-key -Tcopy-mode-vi 'v' send -X begin-selection
  bind-key -Tcopy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -i -selection clipboard'
  
  # Automatically set the window title
  set-window-option -g automatic-rename off
  
  # Activity notifications
  setw -g monitor-activity on
  setw -g visual-activity on
  
  # Improve terminal colors
  # set -g default-terminal "screen-256color"
  # set -ga terminal-overrides ",xterm-256color:Tc"
  
  # Increase scrollback buffer to 10000
  set -g history-limit 10000
  
  # List of plugins
  set -g @plugin 'tmux-plugins/tpm'
  set -g @plugin 'tmux-plugins/tmux-sensible'
  set -g @plugin 'dracula/tmux'
  
  # Set 256 colors
  set -s default-terminal 'tmux-256color'
  
  # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
  run '~/.tmux/plugins/tpm/tpm'
EOF

  echo "tmux configuration appended to ~/.tmux.conf"
else
  echo "tmux configuration already present in ~/.tmux.conf"
fi

# Ensure TPM directory exists
if [ ! -d "~/.tmux/plugins/tpm" ]; then
  echo "TPM directory not found. Please install the TPM plugin manager first."
fi


export PATH=$PATH:$HOME/.local/bin
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh --config $HOME/.dotfiles/themes/M365Princess.omp.json init zsh)"
fi

export WEZTERM_CONFIG_FILE=$HOME/.dotfiles/wezterm/wezterm.lua
alias vim=nvim
alias ovim=vim


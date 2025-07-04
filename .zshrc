export PATH=$PATH:$HOME/.local/bin
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh --config $HOME/.dotfiles/themes/M365Princess.omp.json init zsh)"
fi


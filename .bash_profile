# ~/.bash_profile

[[ -r ~/.bashrc ]] && . ~/.bashrc

# start a graphical session on login
[[ -z "$DISPLAY" ]] && [[ $(tty 2>/dev/null) == /dev/tty1 ]] && command -v start-hyprland &>/dev/null && start-hyprland

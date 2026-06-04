# ~/.bash_profile

[[ -r ~/.bashrc ]] && . ~/.bashrc

# start a graphical session on login
[[ -z "$DISPLAY" ]] && [[ $(tty) == /dev/tty1 ]] && [[ -x ~/startw ]] && ~/startw

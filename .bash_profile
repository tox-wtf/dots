# ~/.bash_profile

[ -r ~/.bashrc ] && . ~/.bashrc

# start a graphical session on login
if [ -z "$DISPLAY" ] && [ $(tty) == "/dev/tty1" ]; then
    [ -x ./startw ] && ./startw
fi

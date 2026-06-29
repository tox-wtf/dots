#!/usr/bin/env bash

case $1 in
    sele)
        grim -g "$(slurp -d -b 00000099 -c f2a978ff)" - |
            tee ~/img/ss/$(date +%Y-%m-%d_%H-%M-%S)_sele.png |
            wl-copy
    ;;
    full)
        grim -o $(hyprctl activeworkspace | grep -o 'monitor .\+:' | sed -e 's,^monitor\s,,' -e 's,:$,,') - |
            tee ~/img/ss/$(date +%Y-%m-%d_%H-%M-%S)_full.png |
            wl-copy
    ;;
esac

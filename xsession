export ENV=$HOME/.kshrc
export PATH=$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH
export GTK_THEME=Arc-Dark-solid
export LC_CTYPE=en_US.UTF-8

feh --bg-scale ~/Pictures/bg.jpg

dunst &
transmission-daemon &

lemonstatus | lemonbar -p -B'#262626' -F'#969696' -f"-xos4-terminus-medium-r-normal--16-160-72-72-c-80-koi8-u" | sh &

alacritty &

dbus-launch --exit-with-session cwm

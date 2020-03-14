xmodmap ~/.xmodmap &
xautolock -locker "sudo zzz" -detectsleep -corners "+00-" -cornerdelay 5 -cornerredelay 30 &
barM &
exec dwm

## Windows

# create window
<prefix>c

# go to window #[number]
<prefix>[number]

#cycle through windows
<prefix>n/p 

#list windows
<prefix>w 

# swap windows
<prefix>:swap-window -s 2 -t 1 

# kill window
<prefix>&

# pane horizontal
<prefix>&
# pane vertical
<prefix>"
# select pane
<prefix>q
# zoom pane
<prefix>z
# turn pane into window
<prefix>!
# close pane
<prefix>x

# sessions
<prefix>s list sessions (ls)

# create session
tmux
tmux new -s my-session
<prefix>:new

# attach to session
tmux attach
tmux attach -t my-session


## General
# install plugins
<prefix>I

# enter copy mode
<prefix>[
# enter selection mode
<C-v><Space>

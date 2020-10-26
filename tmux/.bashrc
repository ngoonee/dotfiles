# TMUX
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    #test -z "$TMUX" && (tmux attach || tmux new-session)
    #test -z "$TMUX" && (tmux new -d -s 0; tmux new -t 0 \; set-option destroy-unattached)
    [ -z "${TMUX}" ] && (tmux attach || tmux)
fi

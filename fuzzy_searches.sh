# https://github.com/junegunn/fzf/

alias nf='nvim $(fzf --height 40%)'

# -----------------------------------------------------------------------------
# https://github.com/junegunn/fzf/wiki/examples#tmux
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then 
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# -----------------------------------------------------------------------------
# https://junegunn.kr/2015/03/fzf-tmux/
# git checkout <branch>
fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf-tmux -d 15 +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

# git merge --no-ff <branch>
alias gmb='git merge --no-ff $(git branch | fzf --height 40%)'


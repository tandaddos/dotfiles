# cd stuff
# alias "-"='cd -'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# misc
alias _='sudo '
alias md='mkdir -p'
alias rd=rmdir
alias which='alias | /usr/bin/which --tty-only --read-alias --show-tilde --show-dot'
alias which-command=whence
alias history=omz_history
alias run-help=man

# search compressed files
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'

# editor stuff
alias chad=nvchad
alias kickstart=nvim-kickstart
alias ks=kickstart
alias lazyvim=nvim-lazyvim
alias lv=lazyvim
alias nvchad=nvim-nvchad
alias nvim-kickstart='NVIM_APPNAME=kickstart nvim'
alias nvim-lazyvim='NVIM_APPNAME=lazyvim nvim'
alias nvim-nvchad='NVIM_APPNAME=NvChad nvim'
function nvims() {
	choices="kickstart\nlazyvim\nNvChad"
	echo "Nvim Configs:"
	choice="$(echo $choices| fzf --layout=reverse --height=~40)"
	echo "choice = $choice"
	NVIM_APPNAME=${choice} nvim
}

# ls stuff
alias e=exa
alias ea='exa -a'
alias el='exa -lF'
alias elr='el -R'
alias elt='el -T'
alias eltr='elt -R'
alias l='ls -lah'
alias l.='ls -d .* --color=auto'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias lsa='ls -lah'

alias ggpur=ggu
alias globurl='noglob urlglobber '

# tmux stuff
alias tma='tmux attach -t '
alias tmk='tmux kill-session -t '
alias tml='tmux ls'
alias tmn='tmux new-session -s '

# zellij stuff
alias za='zellij attach '
alias zk='zellij kill-session '
alias zka='zellij kill-all-sessions'
alias zl='zellij list-sessions'
alias zn='zellij -s '
alias zrun='zellij run '
alias zsetup='zellij setup'

# fzf stuff
export FZF_DEFAULT_COMMAND='fd -t f --color=never --hidden'
export FZF_DEFAULT_OPTS=' --reverse'

export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_CTRL_T_OPTS="--preview='bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND="fd -t d --color=never --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -c {} | head -50'"

alias wi='fzf -m --reverse'
alias wid='fd -t d | fzf -m --reverse --preview='\''tree -C {} | head -n 50'\'' --preview-window=70%,top'

function kiss() {
  selection=$(fd -t d | fzf --reverse --multi --height=80% --border=sharp \
    --preview='tree -C {}' --preview-window='45%,border-sharp' \
    --prompt='Dirs > ' \
    --bind='enter:execute($EDITOR {+})' \
    --bind='del:execute(rm -ri {+})' \
    --bind='ctrl-p:toggle-preview' \
    --bind='ctrl-d:change-prompt(Dirs > )' \
    --bind='ctrl-d:+reload(find -type d)' \
    --bind='ctrl-d:+change-preview(tree -C {})' \
    --bind='ctrl-d:+refresh-preview' \
    --bind='ctrl-f:change-prompt(Files > )' \
    --bind='ctrl-f:+reload(fd -t f)' \
    --bind='ctrl-f:+change-preview(cat {})' \
    --bind='ctrl-f:+refresh-preview' \
    --bind='ctrl-a:select-all' \
    --bind='ctrl-x:deselect-all' \
    --bind='enter:execute(if [ -d {} ]; then cd {}; else $EDITOR {+}; fi)+abort' \
    --header '
    CTRL-d to display directories | CTRL-f to display files
    CTRL-a to select all | CTRL-x to deselect all
    ENTER to edit | DEL to delete
    CTRL-p to toggle preview
    ')

  if [ -d "${selection}" ]; then
    cd "${selection}"
  else
    $EDITOR "${selection}"
  fi
}

# tldr howto
alias howto="tldr --list | fzf --preview='tldr {1} --color=always' --preview-window=right,70% | xargs tldr"

# zoxide stuff
eval "$(zoxide init zsh)"
alias zz='z -'  # go back

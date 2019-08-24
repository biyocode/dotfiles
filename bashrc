# +OUTDATED
# Vagrant Arch custom prompt
PS1='[harukai@kaenatsu-\h \w]\$ '
# Vagrant Kali prompt
PS1='\[\033[01;31m\]harukai@kaenatsu-\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# Vagrant Ubuntu prompt
PS1='harukai@kaenatsu-ubuntu:\w$ '

# ARCH STUFF
alias recentinstalled='grep " installed " /var/log/pacman.log'
alias packagelist='sudo pacman -Qi | egrep "^(Name|Installed)" | cut -f2 -d":" | tr "\nK" " \n" | sort -nrk 2 | less'
alias dxdiag='hardinfo'

# Easy git commit
gcomm() {
    GITMESSAGE="$*"
    git commit -m "$GITMESSAGE"
}

# Checks file/folder size of first argument
function fsize() {
    du -sh "$1"
}

# Creates python shebang file
function createpy() {
    PYFILE="$1"
    if [[ $PYFILE == *".py"* ]]
    then
        touch "$PYFILE"
        echo "#!/usr/bin/env python3" >> "$PYFILE"
        chmod u+x "$PYFILE"
        vim "$PYFILE"
    else
        touch "$PYFILE.py"
        PYFILEPY="$PYFILE.py"
        echo "#!/usr/bin/env python3" >> "$PYFILEPY"
        chmod u+x "$PYFILEPY"
        vim "$PYFILEPY"
    fi
}

alias gpush='git push origin'
alias mpush='git push origin master'
alias gstat='git status .'
alias gdiff='git diff'
alias gadd='git add'
alias gpull='git pull origin'
alias mpull='git pull origin master'

# Custom alias
alias lll='ls -la'
alias ll='ls -l'
alias v='vim'
alias rbr='source ~/.bashrc'
alias cls='printf "\033c"'
alias hgcc='gcc -Wall -Werror -Wextra -pedantic'
alias mynetip='curl "ifconfig.me";echo'
alias ux='chmod u+x'
alias ..='cd ..'
alias biggestfile='ncdu ~'

# Custom scripts
alias gitremotetoken=''
alias cleaner=''

# Bash behavior
#  -> Tab auto-complete
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"

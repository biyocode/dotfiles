# Vagrant Arch custom prompt
PS1='[harukai@kaenatsu-\h \w]\$ '
# Vagrant Kali prompt
PS1='\[\033[01;31m\]harukai@kaenatsu-\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# Vagrant Ubuntu prompt
PS1='harukai@kaenatsu-ubuntu:\w$ '

# Git alias/functions
gcomm() {
    GITMESSAGE="$*"
    git commit -m "$GITMESSAGE"
}
alias gpush='git push origin'
alias mpush='git push origin master'
alias gstat='git status .'
alias gdiff='git diff'
alias gadd='git add'

# Custom alias
alias lll='ls -la'
alias ll='ls -l'
alias v='vim'
alias rbr='source ~/.bashrc'
alias cls='printf "\033c"'
alias hgcc='gcc -Wall -Werror -Wextra -pedantic'
alias mynetip='curl "ifconfig.me";echo'
alias untargz='tar -xvzf'
alias untargz2='tar -xvjf'

# Bash behavior
#  -> Tab auto-complete
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"

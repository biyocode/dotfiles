# Arch custom prompt
PS1='[harukai@kaenatsu-\h \w]\$ '

# Kali prompt
PS1='\[\033[01;31m\]harukai@kaenatsu-\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Ubuntu prompt
PS1='harukai@kaenatsu-ubuntu:\w$ '

# Alias functions
gcomm() {
    git commit -m "$*"
}

# Custom alias
alias lll='ls -la'
alias ll='ls -l'
alias vi='vim'
alias rbr='source ~/.bashrc'
alias cls='printf "\033c"'
alias hgcc='gcc -Wall -Werror -Wextra -pedantic'
alias gpush='git push origin'
alias mpush='git push origin master'

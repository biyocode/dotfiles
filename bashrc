# ARCH STUFF
# Checks recently installed packages
alias recentinstalled='grep " installed " /var/log/pacman.log'
# Checks package list
alias packagelist='sudo pacman -Qi | egrep "^(Name|Installed)" | cut -f2 -d":" | tr "\nK" " \n" | sort -nrk 2 | less'
# Checks system info in a UI
alias dxdiag='hardinfo'

# Easy git commit
# gcomm [THIS IS YOUR MESSAGE]
gcomm() {
    GITMESSAGE="$*"
    git commit -m "$GITMESSAGE"
}

# Checks file/folder size of first argument
# fsize [FILE/FOLDERNAME]
function fsize() {
    du -sh "$1"
}

# Creates python file with shebang and main, then sets ux permissions
# createpy [FILENAME]
function createpy() {
    PYFILE="$1"
    if [[ $PYFILE == *".py"* ]]
    then
        touch "$PYFILE"
        echo "#!/usr/bin/env python3" >> "$PYFILE"
        echo "" >> "$PYFILEPY"
        echo 'if __name__ == "__main__":' >> "$PYFILEPY"
        echo "    pass" >> "$PYFILEPY"
        chmod u+x "$PYFILE"
        vim "$PYFILE"
    else
        touch "$PYFILE.py"
        PYFILEPY="$PYFILE.py"
        echo "#!/usr/bin/env python3" >> "$PYFILEPY"
        echo "" >> "$PYFILEPY"
        echo 'if __name__ == "__main__":' >> "$PYFILEPY"
        echo "    pass" >> "$PYFILEPY"
        chmod u+x "$PYFILEPY"
        vim "$PYFILEPY"
    fi
}

# Json prettifier using python tools
# prettyjson [FILENAME] [NEW_FILENAME]
function prettyjson() {
    JSONFILE="$1"
    NEW_JSONFILE="$2"
    if [[ $NEW_JSONFILE == *".json"* ]]
    then
        if python -m json.tool $JSONFILE >> $NEW_JSONFILE 
        then
            echo "Formatted and created $NEW_JSONFILE"
        else
            echo "ERROR: Either file not found or file not in json format."
        fi
    else
        if python -m json.tool $JSONFILE >> "$NEW_JSONFILE.json"
        then
            echo "Formatted and created $NEW_JSONFILE.json"
        else
            echo "ERROR: Either file not found or file not in json format."
        fi
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

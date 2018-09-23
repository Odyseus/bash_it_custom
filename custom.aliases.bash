#!/bin/bash

# Colored grep/fgrep/egrep
# Need to check an existing file for a pattern that will be found to ensure
# that the check works when on an OS that supports the color option
if grep --color=auto "a" "${BASH_IT}/"*.md &> /dev/null; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    export GREP_COLOR='1;32'
fi

# sudo is too long! LOL
alias _="sudo"

# sudo is too long! LOL
alias r="reset"

# Death to Python 2!!!
alias py='python3'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]; then
    __tree_func(){
        local regEx='s;[^/]*/;└──;g;s;──┘; │;g'
        if [[ $# -gt 0 ]]; then
            find . -maxdepth $1 -print | sort | sed -e "${regEx}"
        else
            find . -print | sort | sed -e "${regEx}"
            # find . -print | sed -e 's;[^/]*/;└──;g;s;──┘; │;g'
        fi
    }

    alias tree="__tree_func $1"
    # Mine working
    # alias tree="find . -print | sed -e 's;[^/]*/;└──;g;s;──┘; │;g'"
    # Original
    # alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Aliases the ls command to display the way I like it
alias ls='ls -lhGpt --color=always'

# apt-get aliases
alias apt-get="sudo apt-get"
alias aptpurge="sudo apt-get purge"                     # Uninstall a package.
alias aptautoclean="sudo apt-get autoclean"             # Clear the local repository.
alias aptautoremove="sudo apt-get autoremove"           # Clear the local repository.
alias aptcheck="sudo apt-get check"                     # Check for broken dependencies.
alias aptins="sudo apt-get install"                     # Install a package.
alias aptupd="sudo apt-get update"                      # Resynchronize repositories.
alias aptsrcdown="sudo apt-get --download-only source"  # Download source package without unpacking.
alias aptsrcupk="sudo apt-get source"                   # Download and unpack source package.
alias aptdebdown="sudo apt-get download"                # Download .deb package.

# Uninstall unused packages.
# Note that I had to escape the quotes after the -F awk argument.
alias aptpurgeunused="dpkg --get-selections | grep deinstall | awk -F' ' '{print $1}' | xargs sudo apt-get -y purge"

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Use nano for visudo
export VISUAL=nano

# Rebase local git repository.
alias gitrebasemaster='echo -e "$(tput bold)$(tput setaf 10)Checking out master...$(tput sgr0)" && git checkout master && echo -e "$(tput bold)$(tput setaf 10)Fetching...$(tput sgr0)" && git fetch upstream && echo -e "$(tput bold)$(tput setaf 10)Rebasing...$(tput sgr0)" && git rebase upstream/master && echo -e "$(tput bold)$(tput setaf 10)Pushing...$(tput sgr0)" && git push origin master'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias restart-cinnamon='nohup cinnamon --replace > /dev/null 2>&1 &'

alias gksudo='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'

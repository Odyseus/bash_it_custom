#!/bin/bash

THEME_SHOW_CLOCK=${THEME_SHOW_CLOCK:-"false"}

export PS3=">> "

## ls colors from zitron theme
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;34:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"

ODY_W="\[\033[1;37m\]"              # White
ODY_G="\[\033[38;5;84;1m\]"         # Green
ODY_O="\[\033[38;5;220;1m\]"        # Orange
ODY_Y="\[\033[38;5;11;1m\]"         # Yellow
ODY_R="\[\033[38;5;215;1m\]"        # Red
ODY_N="\[\033[0m\]"                 # Reset/No color

prompt_command() {
    local ps1_sym
    local python_virt_env
    # Check the exit code of the previous command and display different
    # colors in the prompt accordingly.
    if [ $? -eq 0 ]; then
        ps1_sym="$ODY_W"❯"$ODY_N"
    else
        ps1_sym="$ODY_R"❯"$ODY_N"
    fi

    # Check the exit code of the previous command and display different
    # colors in the prompt accordingly.

    if [[ -n "${VIRTUAL_ENV}" ]]; then
        local python_virt_env_name='$(basename "${VIRTUAL_ENV}")'

        if [ $? -eq 0 ]; then
            python_virt_env="$ODY_G[$ODY_O$python_virt_env_name$ODY_G]$ODY_N"
        else
            python_virt_env="$ODY_Y[$ODY_R$python_virt_env_name$ODY_Y]$ODY_N"
        fi
    else
        python_virt_env=""
    fi

    # Display context.
    local user_host
    user_host=""

    if [[ ${EUID} == 0 ]] ; then
        if [[ "$USER" != "$LOGNAME" || -n "$SSH_CLIENT" ]]; then
            user_host="$ODY_Y[$ODY_R\u$ODY_Y@$ODY_R\h$ODY_Y]"
        fi

        PS1="$user_host$ODY_Y[$ODY_R\w/$ODY_Y]$ODY_R\n\
$python_virt_env$ODY_W"#"$ODY_N${ps1_sym} $ODY_N"

        PS2="$ODY_Y-$ODY_R-$ODY_R-$ODY_N "
    else
        if [[ "$USER" != "$LOGNAME" || -n "$SSH_CLIENT" ]]; then
            user_host="$ODY_G[$ODY_O\u$ODY_G@$ODY_O\h$ODY_G]"
        fi

        PS1="$user_host$ODY_G[$ODY_O\w/$ODY_G]\n\
$python_virt_env$ODY_W\$$ODY_N${ps1_sym} $ODY_N"

        PS2="$ODY_G-$ODY_O-$ODY_O-$ODY_N "
    fi
}

safe_append_prompt_command prompt_command

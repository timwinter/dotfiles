# ~/.bashrc

PATH1=/sbin:/usr/sbin:/usr/local/sbin
PATH2=/bin:/usr/bin:/usr/local/bin
PATH3=/usr/games:/usr/local/games
PATH4=/usr/bin/X11:~/bin:.

PATH=$PATH1:$PATH2:$PATH3:$PATH4

if [ "$PS1" ]; then

	# Add in the bash completion options
	if [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
	
	# User specific prompt function file
	if [ -f ~/.bash_prompts ]; then
		. ~/.bash_prompts
	fi

	# User specific alias file
	if [ -f ~/.bash_aliases ]; then
		. ~/.bash_aliases
	fi

	shopt -s histappend
	# Larger bash history (allow 32³ entries; default is 500)
	export HISTSIZE=32768;
	export HISTFILESIZE=$HISTSIZE;
	export HISTCONTROL=ignoredups;

	# Choose a prompt
	a0

	function em {
		if [ "$PS1" ]; then
			case $TERM in
				xterm*)
					emacs $* &
					;;
				*)
					emacs $*
					;;
			esac
		fi
	}

	function x {
		case $TERM in
			xterm*)
				echo "You're already in a windowmanager..."
				;;
			*)
				cd ; startx
				;;
		esac
	}

	asdf() { setxkbmap dvorak; }
	aoeu() { setxkbmap en_US; }

	LS_COLORS='no=00:fi=00:di=01;36:ln=04;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:'
	export LS_COLORS
	GREP_COLORS='ms=01;36:mc=01;36:sl=:cx=:fn=35:ln=32:bn=32:se=31'
	GREP_OPTIONS="--color=auto"
	export GREP_COLORS GREP_OPTIONS
	alias   ls='ls --color=auto '
	export  PATH  PS1
	umask   022

	export  EDITOR=vim
	export  CVSROOT=/var/lib/cvs

	if [ "$SSH_CLIENT" ]; then
		( (while sleep 20m; do echo -en "\033[D\033[C"; done) & )
		export LOCAL_KEEP_ALIVE=1
	fi
fi

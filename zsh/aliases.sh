alias mv="mv -i";
alias cp="cp -i";

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
	# Find the option for using colors in ls, depending on the version: Linux or BSD
	ls --color -d . &>/dev/null 2>&1 && alias ls='ls -F --color=tty' || alias ls='ls -GF'
fi

if [ $(uname -s ) = "FreeBSD" ]
then
	alias rm="rm -I";
	alias less="less -R";
fi

__exists vim && alias vi="vim";

alias cEterm="\Eterm -C -T 'Console Eterm' -f'red'";
#alias nvlc="nvlc --volume 1024";
#alias vlc="vlc_create_sock";
alias dcvs="cvs -d eadler@dcvs.freebsd.org/home/dcvs";
alias pcvs="cvs -d eadler@pcvs.freebsd.org/home/pcvs";
alias projcvs="cvs -d eadler@projcvs.freebsd.org/home/projcvs";

alias bcvs="cvs -d anoncvs@anoncvs1.FreeBSD.org:/home/ncvs";
alias fbcvs="cvs -d anoncvs@anoncvs.fr.FreeBSD.org:/home/ncvs";
alias projcvs="cvs -d anoncvs@projcvs.FreeBSD.org:/home/projcvs";
alias marcus-cvs="cvs -z3 -d:pserver:anonymous@creme-brulee.marcuscom.com:/space/cvs/marcuscom-cvs";
alias python2="python -tt3";
__exists python3.1 && alias python="python3.1"
alias noflash="pkill -3 -l npviewer.bin";
alias noflash_9="noflash|sed "s/3/9/"|sh -x 2>&1|sed 's/\+ //'";
alias switch-background="pkill idesk && idesk &";
alias youtube-dl="youtube-dl -t";
alias startx="ssh-agent startx -audit 4 -nolisten tcp";
alias sgrep='grep --exclude "*svn*" -I';
alias srcloc="whereis -qs";
alias portmaster="portmaster -m'-DNO_DEPENDS'";
alias urxvt="urxvtcd"
#alias su="su -l"
__exists proxychains && alias pc="proxychains";
alias shareThisDir="python -m http.server 8000";
alias lls="ls -lao";
__exists firefox && alias firefox="firefox -no-remote";
__exists firefox3 && alias firefox="firefox3 -no-remote";
alias tolower="tr A-Z a-z"
alias toupper="tr a-z A-Z"
__exists pastebinit && alias pastebinit="pastebinit -a ''";

alias ll="ls -halt"
	

#alias cd="pushd";
alias p="pushd";
alias b="popd";

# chmod aliases
alias rwx="chmod 700"
alias rw-="chmod 600"
alias r-x="chmod 755"
alias r--="chmod 644"

portsGrep() {
	if [ "x$PORTSDIR" = "x" ]
	then
		PORTSDIR="/usr/ports"
	fi
	find "$PORTSDIR" -depth 2 -type d -execdir fgrep -H "$1" {}/Makefile \;
}


__exists idprio && alias verynice="nice nice idprio 31";

__exists calendar && [ -f /usr/share/calendar/calendar.freebsd ] &&
	alias bsdcal="calendar -f /usr/share/calendar/calendar.freebsd";

__exists now && alias now="now '%a, %b %d %Y, %r %Z (%z)'"


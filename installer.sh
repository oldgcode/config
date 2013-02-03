#! /bin/sh
self=~/.conf;
begon="$self/.begon";
boxnme=$(hostname -s)
osname=$(uname -s)

. $self/zsh/exists.func

_tln () {
	[ -e "$2" ] || (ln -s "$1" "$2" && echo begon \"$2\" >> $begon )
	if [ ! -L "$2" ]; then
		if cmp -s "$1" "$2"; then
			echo "warning: $2 matches $1 but is not symlink";
		else
			echo "warning: $2 does not match $1"
		fi
	fi


}

htln () {
	if [ -e "$self/$1.local.$boxname" ]
	then
		_tln "$self/$1.local.$boxname"
	elif [ -e "$self/$1.os.$osname" ]
	then
		_tln "$self/$1.os.$osname" "$HOME/$2"
	else
		_tln "$self/$1" "$HOME/$2"
	fi
}

ensure_directories() {
	mkdir -p "$@"
}

ensure_directories ~/.zsh/cache
htln zsh/zshrc .zshrc
htln zsh/zlogout .zlogout
htln sh/profile .profile
htln nano/USE_RC .nanorc
htln nano .mynano
htln X/XCompose .XCompose
htln X/xinitrc .xinitrc
htln X/Xmodmap .Xmodmap
htln X/Xdefaults .Xdefaults
htln X/xserverrc .xserverrc
htln X/xbindkeysrc .xbindkeysrc
#htln X/xsession .xsession
htln mercurial/hgrc .hgrc
htln idesk/ideskrc .ideskrc
htln idesk/idesktop .idesktop
ensure_directories ~/.mplayer
htln mplayer/config .mplayer/config
htln mplayer/mencoder.conf .mplayer/mencoder.conf
htln icewm .icewm
htln cvs/cvsrc .cvsrc
htln xpdf/xpdfrc .xpdfrc
htln screen/screenrc .screenrc
ensure_directories ~/.vim/undo ~/.vim/backup ~/.vim/swap ~/.vim/viminfo
htln vim/vimrc .vimrc
#htln git/gitconfig .gitconfig
htln gdb/gdbinit .gdbinit
ensure_directories ~/.config/awesome ~/.config/openbox ~/.config/pianobar
htln awesome/rc.lua .config/awesome/rc.lua
htln pianobar/config .config/pianobar/config
htln openbox/menu.xml .config/openbox/menu.xml
htln openbox/rc.xml .config/openbox/rc.xml
__exists git && git/install.sh	
htln bash/bash_profile_primary.bash .bashrc
htln bash/bash_profile.sh .bash_profile
htln tmux/tmux.conf .tmux.conf
htln readline/inputrc .inputrc
ensure_directories ~/.subversion
htln subversion/config .subversion/config
htln mutt/muttrc .muttrc
htln mail/mailrc .mailrc
htln xchat/xchat.conf .xchat2/xchat.conf
ensure_directories ~/.gnupg
htln gpg/gpg.conf .gnupg/gpg.conf
htln gtk/gtk-bookmarks .gtk-bookmarks
ensure_directories ~/.ssh ~/.ssh/sockets
[ ! -f ~/.ssh/config ] && cp -p $self/ssh/config.template ~/.ssh/config
[ -e $HOME/.mozilla ] && find $HOME/.mozilla -mindepth 3 -maxdepth 3 -type d -name chrome -exec sh -c "[ -e {}/userChrome.css ] || ln -s $self/firefox/userChrome.css {}/userChrome.css" \;
[ -e $HOME/.mozilla ] && find $HOME/.mozilla -mindepth 3 -maxdepth 4 -type l -name userChrome.css -exec sh -c "echo begon \"{}/userChrome.css\" >> $begon" \;
sort -u $begon > $begon-temp && mv $begon-temp $begon;

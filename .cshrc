# $FreeBSD$
#!/bin/csh
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

set default_shell=`grep ${USER} /etc/passwd | cut -d: -f7`
if ($?prompt && ( -x /usr/local/bin/bash ) && $default_shell != "/usr/local/bin/bash") then
   if (! $?comm) then
      set comm = `/bin/ps -fp $$ | tail -1 | awk '{ print $8 }'`
   endif

   if ( "$comm" == "-csh") then
      if ( -x "$HOME/.login" ) then
   source "$HOME/.login"
      endif
      exec /usr/local/bin/bash --login
   else
      exec /usr/local/bin/bash
   endif

endif


alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)
# A righteous umask
# umask 22

setenv	EDITOR	vim
setenv	PAGER	less
setenv  LANG    en_US.UTF-8

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif

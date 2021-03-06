# EXPORT
export TERM="xterm-256color" 
export EDITOR="vim"
export VISUAL="vim"
export LANG="en_US.UTF-8"

#
# ~/.bashrc
#
 [[ $- != *i* ]] && return


# If not running interactively, don't do anything
#[ -z "$PS1" ] && return
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# path

if [ -d "$HOME/.bin" ] ;
      then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
      then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
      then PATH="$HOME/Applications:$PATH"
fi

# Powerline shell
#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

# SHOPT
shopt -s autocd         # cd's to named directory
shopt -s cdspell        # autocorrect cd

# IGNORE CASE SENSiTIVITY WHEN TAB COMPLETING
bind 'set completion-ignore-case on'

### ARCHIVE EXTRACTION  
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf     $1 ;;
            *.tar.gz)   tar xzf     $1 ;;
            *.bz2)      bunzip2     $1 ;;
            *.rar)      unrar x     $1 ;;
            *.gz)       gunzip      $1 ;;
            *.tar)      tar xf      $1 ;;
            *.tbz2)     tar xjf     $1 ;;
            *.tgz)      tar xzf     $1 ;;
            *.zip)      unzip       $1 ;;
            *.Z)        uncompress  $1 ;;
            *.7z)       7z x        $1 ;;
            *tar.xz)    tar xf      $1 ;;
            *tar.zst)   unzstd      $1 ;;
            *)          echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
} 

###### START ALIASES #######

# git bare repository alias
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#alias clear='clear && neofetch' # I use ssh a lot - fancy reminder of what I'm logged into

# pacman and yay
#alias pacsy='sudo pacman -Syyu'                     # update standard packages
#alias pacclean='sudo pacman -Sc --noconfirm'        # cleanup orphaned packages
#alias pacstall='sudo pacman -S'                     # install standard packages
#alias pacrm='sudo pacman -Rs'                       # rm standard packages
#alias pacsearch='pacman -Qs'                        # searching install packages
#alias par='paru'
#alias parstall='paru -S'
#alias parsu='paru -Sua'

# emerge/portage

alias search='eix'
alias install='doas emerge -aqv'
alias remove='doas emerge --deselect'
alias clean='doas emerge --ask --depclean'
alias sync='doas emerge --sync'
alias rysnc='doas emerge-webrsync'
alias world='doas emerge -aqvuDN @world'
alias changed-use='doas emerge --ask --quiet --update --verbose --changed-use --deep @world'
alias read='doas eselect news read'
alias dispatch='doas dispatch-conf'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and directories
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias gstat='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias push='git push'
alias add='git add'

# adding color to grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='ripgrep --color=auto'

# avoid accidental overwrites
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Change direcotry aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Pavucontorl
alias pavc='pavucontrol'

# SSH Shortcuts

# Random 
alias douche='clear && neofetch'

# Shutdown shortucuts
alias reboot='doas shutdown -r now'
alias shutdown='doas shutdown now'

### STARSHIP PROMPT ###
eval "$(starship init bash)"

export NVM_DIR="/home/invokdev/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm



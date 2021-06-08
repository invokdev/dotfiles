#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Neofetch on terminal start
neofetch

### ARCHIVE EXTRACTION  
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $ in
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

alias clear='clear && neofetch' # I use ssh a lot - fancy reminder of what I'm logged into

# pacman and yay
alias pacsy='sudo pacman -Syyu'                     # update standard packages
alias yaysy='yay -Syu --noconfirm'                  # update standard && AUR packages
alias pacclean='sudo pacman -Sc --noconfirm'        # cleanup orphaned packages
alias pacstall='sudo pacman -S'                     # install standard packages
alias yaysu='yay -Sua --noconfirm'                  # update only AUR packages

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
alias stat='git status'
alias tag='git tag'
alias newtag='git tag -a'






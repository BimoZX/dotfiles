################################################
# DEFAULTS
################################################

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
autoload -U colors && colors
autoload -U promptinit
autoload -U is-at-least

promptinit
compinit

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
EDITOR=nvim
setopt autocd extendedglob completealiases
bindkey -v

################################################
# PACKAGES
################################################

# Init
source ~/.zplug/init.zsh
unset ZPLUG_SHALLOW
zstyle ":zplug:tag" depth 1
zplug "zplug/zplug"

# OMZ plugins
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh

# External plugins
zplug "akoenig/npm-run.plugin.zsh"
zplug "arzzen/calc.plugin.zsh"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "hlissner/zsh-autopair", defer:3, \
  use:autopair.zsh
zplug "tarruda/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# File manager
zplug "Vifon/deer", \
  hook-load:'
    fpath=(~/.zplug/repos/Vifon/deer $fpath) &&
    autoload -U deer &&
    zle -N deer;
  '

# Fuzzy finder
zplug "junegunn/fzf", \
  hook-build:'./install --all', \
  hook-load:'[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'

# Apply Zplug things
zplug load

################################################
# ALIASES
################################################

# Bind C-P and C-N to search command history according
# to current input
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Bind backward search key to searching terminal command
bindkey -M vicmd '?' history-incremental-search-backward

# Bind C-space to accept auto suggestion
bindkey '^ ' autosuggest-accept

# Deer (File Manager) binding
bindkey '\ek' deer

# Prettier ls
alias ls='ls --color=auto'

# dotfiles config alias
alias config="/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME"

################################################
# EXPORTS/VARIABLES
################################################

# Additional custom bin path
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# FZF configs
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
      rg --files "") 2> /dev/null'

# VDPAU settings
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=radeonsi

# Chrome variable for testing purposes
export CHROME_BIN=chromium

# Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)

# Foreign completions
fpath=(~/.zsh/completions $fpath)

# Override what counts as word characters
local WORDCHARS='*?_[]~=&;!#$%^(){}<>'

################################################
# FUNCTIONS
################################################

# Function to prepend branch so it triggers JIRA's smart commit
function gitc() {
  git commit -m "`git rev-parse --abbrev-ref HEAD` #comment $1";
}

################################################
# STATUS/PROMPT
################################################

# Add git related info on prompt
precmd () {
  local git_branch="$( git branch 2> /dev/null | grep '*' )"
  local git_changes="$( git status 2> /dev/null | grep 'Changes not staged' )"
  local git_untracked="$( git status 2> /dev/null | grep 'Untracked files:' )"

  if [ "$git_branch" != "" ]; then
    local git_branch="on %{$fg_bold[red]%}$( git rev-parse --abbrev-ref HEAD )%{$reset_color%} "
  else
    local git_branch=""
  fi

  if [ "$git_changes" != "" ]; then
    local git_branch="$git_branch%{$fg_bold[blue]%}?%{$reset_color%}"
  fi

  if [ "$git_untracked" != "" ]; then
    local git_branch="$git_branch%{$fg[blue]%}!%{$reset_color%}"
  fi

# Prompt:
#
# ~/SomeProjects/SomeDev on some-branch ?!
#  .. ls
#
# '?' appears when there's changes
# '!' appears when there's untracked files
PROMPT="
 %{$fg_bold[yellow]%}%~%{$reset_color%} $git_branch
  %{%B$fg[blue]%}··%{$reset_color%b%} "
}

setopt promptsubst

################################################
# MISC.
################################################

# Stops terminal from scroll lock
stty -ixon

# Change cursor shape according to mode
zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    # the command mode for vi
    echo -ne "\e[2 q"
  else
    # the insert mode for vi
    echo -ne "\e[5 q"
  fi
}
echo -ne "\e[5 q"

################################################
# ENVIRONMENT MANAGER
################################################

# ASDF initialization
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"

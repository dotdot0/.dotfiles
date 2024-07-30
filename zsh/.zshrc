ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZP::git
zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo

#Prompt
zinit light nullxception/roundy
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

autoload -U compinit && compinit
zinit cdreplay -q

#ROUNDY_DIR_MODE="dir-only"
#ROUNDY_PROMPT_HAS_GAP=true

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

alias ls='exa'
alias r='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias cat='bat'

# Ensure fzf is installed
FZF_PATH="${XDG_DATA_HOME:-${HOME}}/.fzf"
if [ ! -d "$FZF_PATH" ]; then
 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
 ~/.fzf/install
fi

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf shell integrations
eval "$(fzf --zsh)"
#

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME:/.local/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
[[ ! $PATH == */home/pratush/.fex/bin* ]] && export PATH="/home/pratush/.fex/bin:$PATH"
export FEX_DEFAULT_COMMAND="fex --time-type modified"
[ -f /home/pratush/.fex/.fex.zsh ] && source /home/pratush/.fex/.fex.zsh
bindkey '^f' fex-widget

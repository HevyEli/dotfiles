# Initialize zsh completion
autoload -Uz compinit
compinit

# History options
setopt HIST_IGNORE_ALL_DUPS

# Devbox configuration
DEVBOX_NO_PROMPT=true
eval "$(devbox global shellenv --init-hook)"

# Git configuration
LANG=en_US.UTF-8

# Command completions
source <(devbox completion zsh)
source <(docker completion zsh)
source <(kubectl completion zsh)

# Starship prompt setup
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
eval "$(starship init zsh)"

# The Fuck alias setup
eval $(thefuck --alias)

# Zoxide setup
eval "$(zoxide init --cmd cd zsh)"

# Zinit setup (Plugin Manager)
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load important annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting
zinit light rupa/z

# Bind keys for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Completion menu style
zstyle ':completion:*' menu yes select

# Setup Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias ls='eza --long --all --git --color-scale-mode=gradient'
alias lst='eza --long --all --git --color-scale-mode=gradient --sort modified'
alias lstr='eza --long --all -T --git --color-scale-mode=gradient --sort modified'
alias fzfp='fzf --preview "bat --style numbers --color always {}"'
alias cat='bat --paging never --theme DarkNeon --style plain'

# Additional zsh files
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh

# lg function for lazygit
lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
    lazygit "$@"
    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

# Environment Variables/PATHs
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH:$HOME/bin"
export ZSH="${HOME}/.oh-my-zsh"
export GOPATH="${HOME}/go"
export EDITOR=vim
export KUBE_EDITOR=vim
export AWS_CLI_AUTO_PROMPT=on-partial
export PATH="${PATH}:${HOME}/.krew/bin"
export KUBECONFIG=~/.kube/config

# Load the zsh-z plugin
plugins=(
  zsh-z
  zsh-autosuggestions
  aws
  git
  brew
  docker
  docker-compose
  terraform
  zsh-syntax-highlighting
  helm
  kubectl
  kubectx
)

# Load additional environment variables
[[ -f ~/.zsh/envs.zsh ]] && source ~/.zsh/envs.zsh

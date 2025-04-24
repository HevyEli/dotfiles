#Basics
#alias ls="exa --icons --group-directories-first"
#alias ll="exa -l --icons --no-user --git -s time"
alias vi='nvim'
alias vim='nvim'
alias modvim='vi ~/.config/nvim/init.vim'
alias sshconfig='cat ~/.ssh/config'
alias modssh='vi ~/.ssh/config'
alias modzsh='vi ~/.zshrc'
alias modbash='vi ~/.zshrc'
alias modalias='vi ~/.zsh/aliases.zsh'
alias modfunc='~/.zsh/functions.zsh'
alias modaws='vi ~/.aws/config'
alias hosts='ansible-inventory --graph'
alias grep='grep -i --color'
alias pip='pip3'

# Kubernetes
alias k='kubectl'
alias h='helm'
alias ctx='kubectx'
alias ns='kubens'
alias contexts='kubectl config get-contexts'

# AWS
alias awsconfig='cat ~/.aws/config'
alias awslogin='aws sso login; aws configure list-profiles'
alias awsprofiles='aws configure list-profiles'

#Custom
alias randomPassGen="python3 ~/Documents/repos/private/tools/randomPassGen/randomPassGen.py"
alias jump1="ssh -i ~/.ssh/michaleli-key-ecdsa eliasm1@jump-cz-1.fed.tmo"
alias jump2="ssh -i ~/.ssh/michaleli-key-ecdsa eliasm1@jump-cz-2.fed.tmo"
alias createHelmProj="~/Documents/repos/private/tools/createHelmProj.sh"
alias cat="bat --paging=never"
alias switchReposToDev="~/Documents/repos/private/tools/updateRepos.sh"
alias fixGitLabSSH="ssh-add -K ~/.ssh/michaleli-key-rsa && eval "$(ssh-agent -s)" ssh-add ~/.ssh/michaleli-key-rsa"
alias code='open -a "Visual Studio Code"'
alias la=tree
alias rr='ranger'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# K8S
export KUBECONFIG=~/.kube/config
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'
alias podname=''

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

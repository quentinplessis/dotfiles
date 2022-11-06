if status is-interactive
    # Commands to run in interactive sessions can go here
    # eval (/opt/homebrew/bin/brew shellenv)
    eval (/usr/local/bin/brew shellenv)
end

# Alias
alias vim='nvim'

# Work config
alias work_config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Git
alias gsweep='git branch --merged | egrep -v "(^\*|master|main|qa|develop)" | xargs git branch -d'

# Tmux
alias ta='tmux -2 attach -t'
alias tad='tmux -2 attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux -2 list-sessions'
alias tksv='tmux -2 kill-server'
alias tkss='tmux -2 kill-session -t'

# Terraform
alias tf='terraform'
set -xg TF_PLUGIN_CACHE_DIR "$HOME/.terraform.d/plugin-cache"

# Fish
set -g theme_color_scheme gruvbox
set -g theme_nerd_fonts yes

# Anyenv
set -gx PATH $HOME/.anyenv/bin $PATH
# anyenv init - fish | source

# pyenv 
set -x PYENV_ROOT "$HOME/.anyenv/envs/pyenv"
set -x PATH "$HOME/.anyenv/envs/pyenv/bin" $PATH
status is-interactive; and pyenv init --path | source
pyenv init - | source

# goenv
set -x GOENV_ROOT "$HOME/.anyenv/envs/goenv"
set -x PATH "$HOME/.anyenv/envs/goenv/bin" $PATH
set -x PATH "$HOME/.anyenv/envs/goenv/shims" $PATH
status --is-interactive; and source (goenv init -|psub)

# tfenv
set -x TFENV_ROOT "$HOME/.anyenv/envs/tfenv"
set -x PATH "$HOME/.anyenv/envs/tfenv/bin" $PATH
eval (tfenv init - | source)

# rbenv
set -x RBENV_ROOT "$HOME/.anyenv/envs/rbenv"
set -x PATH "$HOME/.anyenv/envs/rbenv/bin" $PATH
status --is-interactive; and source (rbenv init -|psub)

# nodenv
set -x NODENV_ROOT "$HOME/.anyenv/envs/nodenv"
set -x PATH "$HOME/.anyenv/envs/nodenv/bin" $PATH
eval (nodenv init - | source)

# aws
# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# direnv
direnv hook fish | source

# gcloud
source $HOME/google-cloud-sdk/path.fish.inc

# kubectl
source ~/.kubectl_aliases

# fix path
fix_path

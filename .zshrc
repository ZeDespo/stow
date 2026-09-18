###########################################################
# Setup with custom shell 
###########################################################
source $HOME/.config/zsh/setup.zsh

###########################################################
# Custom auto completion
###########################################################
fpath=($ZSH_DIR/auto-complete/ $fpath)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:make:*' tag-order 'targets'

# Autocompletions that get automatically set up
eval "$(docker completion zsh)"
eval "$(pass-cli completions zsh)"
eval "$(task --completion zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"


###########################################################
# PLUGINS
###########################################################

# pkgfile "command not found" handler
source $ZSH_DIR/plugins/command-not-found.zsh

# Copying and pasting stuff 
source $ZSH_DIR/plugins/copyfile/copyfile.plugin.zsh 
source $ZSH_DIR/plugins/copypath/copypath.plugin.zsh

# EZA (ls alternative)
# eza config - must be set BEFORE loading the plugin
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes
source $ZSH_DIR/plugins/eza/eza.plugin.zsh

# Fuzzy finder 
source $ZSH_DIR/plugins/fzf/fzf.plugin.zsh
export FZF_BASE=/usr/share/fzf
# Fuzzy tab completion
source $ZSH_DIR/plugins/fzf-tab/fzf-tab.plugin.zsh


# GPG Agent bugs for different shells address 
source $ZSH_DIR/plugins/gpg-agent/gpg-agent.plugin.zsh

# History substring search using up and down arrows 
source $ZSH_DIR/plugins/history-substring-search/history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Python utilities
# Remove python compiled byte-code and mypy/pytest cache in either the current
# directory or in a list of specified directories (including sub directories).
function pyclean() {
  find "${@:-.}" -type f -name "*.py[co]" -delete
  find "${@:-.}" -type d -name "__pycache__" -delete
  find "${@:-.}" -depth -type d -name ".mypy_cache" -exec rm -r "{}" +
  find "${@:-.}" -depth -type d -name ".pytest_cache" -exec rm -r "{}" +
  find "${@:-.}" -depth -type d -name ".ruff_cache" -exec rm -r "{}" +
}

# SSH 
source $ZSH_DIR/plugins/ssh/ssh.plugin.zsh
source $ZSH_DIR/plugins/ssh-agent/ssh-agent.plugin.zsh

# thefuck 
source $ZSH_DIR/plugins/thefuck/thefuck.plugin.zsh 
eval $(thefuck --alias)
alias f="fuck"

# UV Venv Automatic activation 
source $ZSH_DIR/plugins/zsh-uv-env/zsh-uv-env.plugin.zsh

# Zoxide 
source $ZSH_DIR/plugins/zoxide/zoxide.plugin.zsh 


# Make ZSH act more like FISH 
# History finder 
source $ZSH_DIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# auto-suggestions by pressing -> 
source $ZSH_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting
source $ZSH_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###########################################################
# Environment variables and miscellaneous aliases.
###########################################################

# NodeJS
export NVM_DIR="$HOME/.config/nvm"

# Make NEOVIM discoverable / accessable
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export EDITOR="nvim"
alias nv=nvim

# Rust up
export PATH="$PATH:$HOME/.cargo/bin"

# Tmuxifier 
export PATH=$HOME/.config/tmux/plugins/tmuxifier/bin/:$PATH
eval "$(tmuxifier init -)"

# LEMONADE LLM Hoster 
export LEMONADE_WEBSERVER_PORT=11434
# CLAUDE CODE
export ANTHROPIC_BASE_URL="http://localhost:${LEMONADE_WEBSERVER_PORT}/v1"
export ANTHROPIC_AUTH_TOKEN="local"
export ANTHROPIC_API_KEY=""

# Overwrite base unix commands 
alias ls="eza"
alias zd="zoxide"

# SSH Aliases
alias _ssh="ssh -i ~/.ssh/id_ed25519"
alias ssh-opensense="_ssh root@192.168.1.1 -p 44000"
# Router access
alias ssh-nascar="TERM=xterm-256color ssh adespotakis@192.168.1.2"
# NAS Shell access
alias ssh-helios="ssh zedespo@192.168.1.3"
# Main server

# WIREGUARD (assuming it's correctly configured)
alias wg-up='wg-quick up wg0'
alias wg-down='wg-quick down wg0'

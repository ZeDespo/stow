# Local binaries might need to overwrite system binaries in this shell.
# Prepend instead of append
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH

# NodeJS
export NVM_DIR="$HOME/.config/nvm"

# Make NEOVIM discoverable
export EDITOR="nvim"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Standardize date
export DATE=$(date +%Y-%m-%d)

# Pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Rust
. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"


# Starship CONFIG file
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# tmuxifier initialization 
export PATH=$HOME/.config/tmux/plugins/tmuxifier/bin/:$PATH
eval "$(tmuxifier init -)"

# LOCAL LLM 
export LEMONADE_WEBSERVER_PORT=11434
export ANTHROPIC_BASE_URL="http://localhost:${LEMONADE_WEBSERVER_PORT}/v1"
export ANTHROPIC_AUTH_TOKEN="local"
export ANTHROPIC_API_KEY=""

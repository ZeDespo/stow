# Aliases go here

# Neovim gang
# alias nvim="~/.config/nvim-macos-arm64/bin/nvim"
alias nv="nvim"
alias vimdiff="nvim -d"

# Base overwrite commands
alias ls="lsd"

# A good looking diff
alias diff-sf="diff-so-fancy"

alias docker-compose="docker compose"

# Easy configuration editing
alias zsource="source ${HOME}/.zshrc"
alias aliasedit="$EDITOR ${ZSH_CONFIG}/aliases.zsh"
alias zshedit="$EDITOR ${HOME}/.zshrc"

# Easy copying and pasting
alias copy="clipcopy"
alias paste="clippaste"

# The F*ck, auto-command fixer
eval $(thefuck --alias)
alias f="fuck"

alias ts="tmuxifier load-session"
alias tn="tmuxifier load-window"

# Youtube-DL

function ydla() {
    output="${HOME}/d/Music/Youtube/"
    cd $output && \
        yt-dlp \
            --retries infinite \
	    --verbose \
            --extract-audio \
            --audio-format m4a \
            --audio-quality 0 \
            --embed-thumbnail \
            --output "%(title)s.%(ext)s" \
            -4 \
            --download-archive "$output/.youtube-dl.txt" \
            $1
}

# Git 
alias gd="git diff | diff-so-fancy"

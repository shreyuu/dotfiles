# Enable Powerlevel10k instant prompt.
# Keep this near the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ============================================================
# Homebrew
# ============================================================

export HOMEBREW_ARCH="arm64"

if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


# ============================================================
# Oh My Zsh
# ============================================================

export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Use hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Oh My Zsh update settings
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Disable command auto-correction
ENABLE_CORRECTION="false"

# Show dots while waiting for completion
COMPLETION_WAITING_DOTS="true"


# ============================================================
# History
# ============================================================

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt extended_history


# ============================================================
# Oh My Zsh plugins
# Keep zsh-syntax-highlighting as the final plugin
# ============================================================

plugins=(
  git
  zsh-autosuggestions
  brew
  macos
  npm
  docker
  docker-compose
  kubectl
  aws
  gcloud
  terraform
  golang
  pip
  pyenv
  history
  sudo
  alias-finder
  extract
  themes
  web-search
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"


# ============================================================
# Powerlevel10k configuration
# ============================================================

[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"


# ============================================================
# Pyenv
# ============================================================

export PYENV_ROOT="$HOME/.pyenv"

if [[ -d "$PYENV_ROOT/bin" ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init - zsh)"
fi


# ============================================================
# Java 21
# ============================================================

if /usr/libexec/java_home -v 21 >/dev/null 2>&1; then
  export JAVA_HOME
  JAVA_HOME=$(/usr/libexec/java_home -v 21)
elif [[ -d "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home" ]]; then
  export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
fi

if [[ -n "$JAVA_HOME" ]]; then
  export PATH="$JAVA_HOME/bin:$PATH"
fi


# ============================================================
# Android SDK
# ============================================================

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

# Retained for compatibility with software that still uses ANDROID_HOME
export ANDROID_HOME="$ANDROID_SDK_ROOT"

export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"


# ============================================================
# Node Version Manager
# ============================================================

export NVM_DIR="$HOME/.nvm"

[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"


# ============================================================
# Local binaries
# ============================================================

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"


# ============================================================
# fzf
# ============================================================

[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"


# ============================================================
# Preferred editor
# ============================================================

if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR="nvim"
else
  export EDITOR="vim"
fi

export VISUAL="$EDITOR"


# ============================================================
# Aliases
# ============================================================

alias zshconfig="nano ~/.zshrc"
alias p10kconfig="nano ~/.p10k.zsh"
alias reloadzsh="source ~/.zshrc"
alias zshcheck="zsh -n ~/.zshrc"

alias ll="ls -lah"
alias cls="clear"
alias ..="cd .."
alias ...="cd ../.."


# ============================================================
# Custom functions
# ============================================================

# Return to the previous working directory
cdback() {
  builtin cd -
}


# ============================================================
# zsh-autosuggestions configuration
# ============================================================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# ============================================================
# Anthropic Claude Code subscription setup
# ============================================================

unset ANTHROPIC_AUTH_TOKEN
unset ANTHROPIC_BASE_URL
unset ANTHROPIC_MODEL
unset ANTHROPIC_API_KEY


# Local Claude configurations retained for future use
#
# export ANTHROPIC_AUTH_TOKEN="ollama"
# export ANTHROPIC_API_KEY=""
# export ANTHROPIC_BASE_URL="http://localhost:11434"
#
# alias claude-local='ANTHROPIC_AUTH_TOKEN=ollama ANTHROPIC_API_KEY="" ANTHROPIC_BASE_URL=http://localhost:11434 claude --model qwen3-coder:latest'
# alias claude-cloud='ANTHROPIC_AUTH_TOKEN=ollama ANTHROPIC_API_KEY="" ANTHROPIC_BASE_URL=http://localhost:11434 claude --model qwen3-coder:480b-cloud'
# alias claude-fast='ANTHROPIC_AUTH_TOKEN=ollama ANTHROPIC_API_KEY="" ANTHROPIC_BASE_URL=http://localhost:11434 claude --model qwen3:8b'
# alias claude-oss='ANTHROPIC_AUTH_TOKEN=ollama ANTHROPIC_API_KEY="" ANTHROPIC_BASE_URL=http://localhost:11434 claude --model gpt-oss:20b'


# ============================================================
# iTerm2 shell integration
# Keep this near the end of the file
# ============================================================

if [[ -e "$HOME/.iterm2_shell_integration.zsh" ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

# Start Pixel 9 emulator without snapshots or data reset
alias pixel9='adb start-server >/dev/null 2>&1 && emulator -avd Pixel_9 -no-snapshot-load -no-snapshot-save -gpu host'
# Close the running Android emulator and stop ADB
alias pixel9off='adb emu kill >/dev/null 2>&1; adb kill-server >/dev/null 2>&1; echo "Pixel 9 emulator powered off."'
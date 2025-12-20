# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Use hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Auto-update settings
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Command auto-correction
ENABLE_CORRECTION="false"

# Show dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
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
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Aliases
alias zshconfig="nano ~/.zshrc"
alias p10kconfig="nano ~/.p10k.zsh"

# Custom functions
function cdback() {
  cd "$(fc -l 1 | head -n 1)"
}

# zsh-autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Load syntax highlighting (must be near the end)
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Homebrew paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export HOMEBREW_ARCH=arm64

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

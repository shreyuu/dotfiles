# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Use hyphen-insensitive completion (disable case-sensitive completion)
HYPHEN_INSENSITIVE="true"

# Auto-update settings
zstyle ':omz:update' mode reminder  # Just remind to update
zstyle ':omz:update' frequency 13    # Check for updates every 13 days

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Increase history file size and settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history    # Append history instead of overwriting
setopt share_history     # Share history across all sessions

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Set list of plugins to load
plugins=(git zsh-autosuggestions zsh-syntax-highlighting brew macos npm docker docker-compose kubectl aws gcloud terraform golang pip pyenv history sudo alias-finder extract themes web-search)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Custom aliases
alias zshconfig="nano ~/.zshrc"
alias p10kconfig="nano ~/.p10k.zsh"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom functions
function cdback() {
    cd $(fc -l 1 | head -n 1)  # Go to last directory from history
}

# zsh-autosuggestions setup
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Load syntax highlighting (ensure this is sourced last for better performance)
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export HOMEBREW_ARCH=arm64

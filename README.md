# dotfiles

My personal dotfiles for macOS, featuring a customized Zsh configuration with Powerlevel10k theme and Oh My Zsh.

## 🚀 Features

- **Zsh** with [Oh My Zsh](https://ohmyz.sh/) framework
- **Powerlevel10k** theme for a beautiful and informative prompt
- **Syntax highlighting** and **autosuggestions** for improved command-line experience
- **Pyenv** integration for Python version management
- Extensive plugin support for various development tools

## 📦 Included Configurations

- [`.zshrc`](.zshrc) - Main Zsh configuration
- [`.zprofile`](.zprofile) - Zsh profile settings
- [`.profile`](.profile) - Shell profile settings
- [`.p10k.zsh`](.p10k.zsh) - Powerlevel10k theme configuration

## 🔌 Installed Plugins

The configuration includes the following Oh My Zsh plugins:

- `git` - Git aliases and functions
- `zsh-autosuggestions` - Fish-like autosuggestions
- `zsh-syntax-highlighting` - Syntax highlighting for commands
- `brew` - Homebrew completions
- `macos` - macOS-specific aliases
- `npm`, `pip` - Package manager integrations
- `docker`, `docker-compose`, `kubectl` - Container orchestration tools
- `aws`, `gcloud`, `terraform` - Cloud platform tools
- `golang`, `pyenv` - Programming language support
- `history`, `sudo`, `alias-finder`, `extract`, `themes`, `web-search` - Utility plugins

## 🛠️ Prerequisites

Before using these dotfiles, ensure you have the following installed:

```sh
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Zsh (usually pre-installed on macOS)
brew install zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
brew install powerlevel10k

# Install zsh-autosuggestions
brew install zsh-autosuggestions

# Install zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# Install Pyenv
brew install pyenv
```

## 📥 Installation

1. Clone this repository:

```sh
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
```

2. Backup your existing dotfiles:

```sh
mv ~/.zshrc ~/.zshrc.backup
mv ~/.zprofile ~/.zprofile.backup
mv ~/.profile ~/.profile.backup
```

3. Create symbolic links:

```sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
```

4. Reload your shell configuration:

```sh
source ~/.zshrc
```

## ⚙️ Customization

### Editing Configurations

Use the provided aliases for quick editing:

```sh
zshconfig   # Edit .zshrc
p10kconfig  # Edit Powerlevel10k configuration
```

### Customizing Powerlevel10k

To reconfigure the Powerlevel10k theme:

```sh
p10k configure
```

## 📝 Custom Aliases & Functions

The configuration includes custom aliases and functions:

- `zshconfig` - Quickly edit [`.zshrc`](.zshrc)
- `p10kconfig` - Quickly edit Powerlevel10k configuration
- `cdback()` - Navigate to the last directory from history

## 🔒 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs. If you have suggestions or improvements, pull requests are welcome!

## 📚 Resources

- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Pyenv Documentation](https://github.com/pyenv/pyenv)
- [Homebrew](https://brew.sh/)

---

Made with ❤️ by Shreyash Meshram

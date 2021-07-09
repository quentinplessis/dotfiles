
# Install
Setup alias
```
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
source $HOME/.bashrc
```

Clone
```
git clone --bare git@github.com:quentinplessis/dotfiles.git $HOME/.cfg
```

Backup current config
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Apply config
```
config checkout
config config --local status.showUntrackedFiles no
```

# Update files

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

# Themes
https://github.com/base16-manager/base16-manager

```
brew tap chrokh/tap
brew install base16-manager
```

```
base16-manager list-support

// Install a bunch of templates.
base16-manager install chriskempson/base16-shell
base16-manager install chriskempson/base16-vim

// What themes are installed now I have templates?
base16-manager list-themes

// Set a theme for all installed templates.
base16-manager set solarized-dark

base16_solarized-dark
```

# OMZ

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -L git.io/antigen > antigen.zsh
```

# Misc

```
brew install autojump
brew install fd
brew install thefuck
brew install fzf
brew tap sambadevi/powerlevel9k
brew install powerlevel9k
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

# go
curl -sSL https://git.io/g-install | sh -s
go get -u github.com/alecthomas/chroma/cmd/chroma
brew install golangci/tap/golangci-lint
brew upgrade golangci/tap/golangci-lint

# vim
brew install vim

go get -u github.com/jstemmer/gotags

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
p10k configure
```

# Vim

```
:GoInstallBinaries
```

# References

- https://www.atlassian.com/git/tutorials/dotfiles

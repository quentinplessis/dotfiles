
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

# References

- https://www.atlassian.com/git/tutorials/dotfiles

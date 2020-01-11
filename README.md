
# Install
Setup alias
```
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
source $HOME/.bashrc
```

Clone
```
git clone --bare https://github.com/quentinplessis/dot_files $HOME/.cfg
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

# References

- https://www.atlassian.com/git/tutorials/dotfiles

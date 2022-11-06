# Install
Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Setup config alias
```
echo "alias work_config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
source $HOME/.zshrc
```

Clone config
```
git clone --bare https://github.com/quentinplessis/dotfiles.git $HOME/.cfg
```

Backup current config
```
mkdir -p .config-backup && \
work_config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Apply config
```
work_config checkout
work_config config --local status.showUntrackedFiles no
```

Init
```
sh $HOME/init.sh
```

# Update Config

```
work_config status
work_config add .vimrc
work_config commit -m "Add vimrc"
work_config add .bashrc
work_config commit -m "Add bashrc"
work_config push
```

# References

- https://www.atlassian.com/git/tutorials/dotfiles

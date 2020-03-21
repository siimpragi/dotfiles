# Dotfiles

https://www.atlassian.com/git/tutorials/dotfiles

```bash
git clone --bare https://github.com/siimpragi/dotfiles.git $HOME/.dot
function dot {
  /usr/bin/git --git-dir=$HOME/.dot --work-tree=$HOME $@
}
mkdir -v $HOME/.dotfiles-backup
dot checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv -v {} $HOME/.dotfiles-backup/{}
fi;
dot checkout
dot config status.showUntrackedFiles no
```

# Please run from user home directory

git clone --bare --recurse-submodules git@github.com:kmchu/dotfiles.git $HOME/.dotfiles
function config {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
config submodule init
config submodule update
source .bashrc

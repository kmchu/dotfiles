# Bash profile always used on MacOS

export PATH="$HOME/.homebrew/bin:$PATH"
eval "$(nodenv init -)"
eval "$(rbenv init -)"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Custom Aliases
cdls() { cd "$@" && ls -la; }
# For dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

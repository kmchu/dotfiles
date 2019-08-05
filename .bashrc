if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS 
    export PATH="$HOME/.homebrew/bin:$PATH"
    eval "$(nodenv init -)"
    eval "$(rbenv init -)"

    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
# elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux/Windows Subsystem for Linux
fi

# Custom Aliases
cdls() { cd "$@" && ls -la; }
alias ll='ls -la'
# For dotfile management
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

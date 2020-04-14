if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS 
    export PATH="$HOME/.homebrew/bin:$PATH"
    eval "$(nodenv init -)"
    eval "$(rbenv init -)"

    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
    export TERM="xterm"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux/Windows Subsystem for Linux
    export DOCKER_HOST="http://localhost:2375"
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
    # Install Ruby Gems to ~/gems
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
fi

# Custom Aliases
cdls() { cd "$@" && ls -la; }
alias ll='ls -la'
alias vim='nvim'
# For dotfile management
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

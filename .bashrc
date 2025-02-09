if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS 
    export PATH="$HOME/.homebrew/bin:$HOME/.local/bin:$PATH"

    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
    export PATH="$PATH:~/Projects/kotlin-language-server/server/build/install/server/bin"
    export TERM="screen-256color"
    export JAVA_HOME=$(/usr/libexec/java_home -v17)
    export BASH_SILENCE_DEPRECATION_WARNING=1

    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Bash completion delegation
    # https://gist.github.com/mwhite/6887990
    [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

    # NVM set needed for managing node versionis
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux/Windows Subsystem for Linux
    export DOCKER_HOST="http://localhost:2375"
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
    # Install Ruby Gems to ~/gems
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

export GIT_EDITOR="nvim"
set -o vi

# For dotfile management
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# General Aliases
cdls() { cd "$@" && ls -la; }
alias ll='ls -la'
alias vim='nvim'


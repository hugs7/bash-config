alias rs='. ~/.bashrc'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

dedupe_path() {
  export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')
}

pathadd() {
  if [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

pathadd_safe() {
  export PATH="$1:$PATH"
  dedupe_path
}

# Local applications on path
pathadd_safe "$HOME/.local/bin"

# Get the directory where this script is located
BASH_CONFIG_DIR="$HOME/.bash_config"

# Function to import modules
import_module() {
  local module="$1"
  if [ -f "$BASH_CONFIG_DIR/$module" ]; then
    . "$BASH_CONFIG_DIR/$module"
  else
    echo "Warning: Module $module not found in $BASH_CONFIG_DIR" >&2
  fi
}

import_module "git.sh"

GREEN="\[\033[1;32m\]"
BLUE="\[\033[1;34m\]"
CYAN="\[\033[1;36m\]"
RESET="\[\033[0m\]"

export PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${RESET}${CYAN}\$(__git_ps1 ' (%s)')${RESET}\$ "  

import_module "user_aliases.sh"
import_module "nvm.sh"
import_module "npm.sh"

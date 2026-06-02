# Git Integration
if ! type __git_complete >/dev/null 2>&1; then
    if [ -f /usr/share/bash-completion/completions/git ]; then
        source /usr/share/bash-completion/completions/git
    elif [ -f /usr/share/git/completion/git-completion.bash ]; then
        source /usr/share/git/completion/git-completion.bash
    fi
fi

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

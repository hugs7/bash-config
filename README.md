# Bash Config

This is just a repo where I put shared bash config. You're welcome to share / fork.

## Usage

```bash
# From root directory
$ git clone git@github.com:hugs7/bash-config.git ~/.bash-config
```

In your `~/.bashrc` file

```sh
# Import shared bash-config
if [ -f ~/.bash-config/bash-config.sh ]; then
  . ~/.bash-config/bash-config.sh
fi
```

# Bash Config

This is just a repo where I put shared bash config. You're welcome to share / fork.

## Usage

```bash
# From root directory
$ git clone git@github.com:hugs7/bash-config.git .bash_config
```

In your `~/.bashrc` file

```sh
# Import shared bash_config
if [ -f ~/.bash_config/bash_config.sh ]; then
  . ~/.bash_config/bash_config.sh
fi
```

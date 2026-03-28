# Bash aliases
alias h=history

# Git aliases
alias g=git
alias gs='g st'
alias gst='gs'
alias gbr='g br'
alias gcm='g cm'
alias gd='g diff --word-diff=color'
alias gl='g log'
alias grs='g rs'
alias gre='g re'
alias gcp='g cp'
alias grb='g rb'
alias gco='g co'
alias gpro='g pro'
alias gpu='g push'
alias gpushu='g pushu'
alias gf='g fetch'
alias ga='g add'
alias gad='ga .'
alias gpull='g pull'
alias gpul='g pull'
alias gt='g tree'
alias gcl='g cl'
alias grv='g rv'
alias gqpr='g qpr'
alias pt='g pull; g tree'

# Clipboard
alias clip='xclip -selection clipboard'

# Neovim
alias nv=nvim

# Npm / Npx / NodeJS Alias
alias n="npm"
alias na='n audit'
alias naf='na fix'
alias naff='naf --force'
alias nr='n run'
alias nrb='nr build'
alias nrbu='nrb -w ui'
alias nrba='nrb -w api'
alias nt='n test'
alias ntu='nt -w ui'
alias nta='nt -w api'
alias nrd='nr dev'
alias nrdu='nrd -w ui'
alias nrda='nrd -w api'
alias nrp='nr preview'
alias ni='n i'
alias nci='n ci'
alias x="npx"
alias v="x vitest"
alias j="x jest"

# Register git completion helpers for the aliases that need them.
if type __git_complete >/dev/null 2>&1; then
	git_alias_completions=(
		"g:_git"
		"gs:_git_status"
		"gst:_git_status"
		"gbr:_git_branch"
		"gcm:_git_commit"
		"gd:_git_diff"
		"gl:_git_log"
		"grs:_git_restore"
    "gre:_git_reset"
		"gcp:_git_cherry_pick"
		"grb:_git_rebase"
		"gco:_git_checkout"
		"gpro:_git_remote"
		"gpu:_git_push"
		"gpushu:_git_push"
		"gf:_git_fetch"
		"ga:_git_add"
		"gad:_git_add"
		"gpull:_git_pull"
		"gpul:_git_pull"
		"gt:_git_log"
		"gcl:_git_clone"
		"grv:_git_revert"
		"gqpr:_git"
	)
	for completion in "${git_alias_completions[@]}"; do
		alias_name=${completion%%:*}
		func_name=${completion#*:}
		__git_complete "$alias_name" "$func_name"
	done
fi

# Amp
alias a='amp'
alias atc='a threads continue'
alias atcl='atc --last'

# Bash aliases
alias h=history

# System
alias sau='sudo apt update && sudo apt upgrade -y'
alias df='df -hT --exclude-type=tmpfs --exclude-type=devtmpfs --exclude-type=efivarfs --exclude-type=proc --exclude-type=sysfs --exclude-type=cgroup --exclude-type=debugfs --exclude-type=tracefs --exclude-type=pstore --exclude-type=bpf --exclude-type=securityfs --exclude-type=devpts'

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
alias gp='g pull'
alias gpul='gp'
alias gpull='gp'
alias gt='g tree'
alias gcl='g cl'
alias grv='g rv'
alias gqpr='g qpr'
alias gdb='g db'
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

# Pnpm / Pnpx Alias
alias p="pnpm"
alias px='p dlx'
alias pe='p exec'

alias pi='p install'
alias pci='p ci'
alias pif='pi --frozen-lockfile'
alias pid='pi --prod=false'
alias prun='p run'
alias pr='prun'

alias pad='pa -D'
alias pae='pa -E'
alias pade='pad -E'
alias pag='pa -g'
alias prm='p remove'
alias ppc='p peers check'
alias pup='p update'
alias pupl='pup --latest'
alias po='p outdated'
alias pa='p audit'
alias pfix='paudit --fix'

alias pd='pr dev'
alias pb='pr build'
alias pte='pr test'
alias ptw='pte --watch'
alias ptu='pte -- --update'
alias pl='pr lint'
alias plf='pl --fix'
alias pf='pr format'
alias pc='pr check'
alias pst='pr start'
alias pp='pr preview'

alias pw='p -r'
alias pwr='pw run'
alias pwi='pw install'
alias pwb='pwr build'
alias pwt='pwr test'
alias pwdv='pwr dev'
alias pwl='pwr lint'
alias pwc='pwr check'

alias pfl='p --filter'
alias pfr='p -r --filter'
alias pui='pfl ui'
alias papi='pfl api'
alias pdu='pui run dev'
alias pda='papi run dev'
alias pbu='pui run build'
alias pba='papi run build'
alias ptui='pui run test'
alias ptapi='papi run test'

alias pv='px vitest'
alias pj='px jest'
alias pn='px next'
alias ptsx='px tsx'
alias pcov='pte -- --coverage'
alias pbt='pi && pb && pte'

# Register git completion helpers for the aliases that need them.
if type __git_complete >/dev/null 2>&1; then
	# Complete both local and remote branch names (remote prefix stripped, and
	# origin/HEAD filtered out) so `git db` can target remote-only branches.
	_git_complete_all_branches() {
		__gitcomp_nl "$(
			{
				git for-each-ref --format='%(refname:short)' refs/heads 2>/dev/null
				git for-each-ref --format='%(refname)' refs/remotes 2>/dev/null |
					grep -v '/HEAD$' | sed 's#^refs/remotes/[^/]*/##'
			} | sort -u
		)"
	}
	_git_delete_branch_alias() {
		_git_complete_all_branches
	}
	_git_delete_branch() {
		_git_complete_all_branches
	}
	_git_db() {
		_git_complete_all_branches
	}

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
		"gdb:_git_delete_branch_alias"
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

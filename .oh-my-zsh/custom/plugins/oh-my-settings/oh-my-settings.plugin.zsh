alias ,ll='ls -alF'
alias ,dv='cd /Users/marek/work/src/vendavo'
alias ,dg='cd /Users/marek/git'
alias ,dt='cd /Users/marek/tmp'
alias ,openports="sudo lsof -i -P | grep -i 'listen'"
alias ,dock="ssh root@docker"
alias ,gitupdater2="find . -name .git -type d | xargs -n1 -P4 -I% git --git-dir=% --work-tree=%/.. fetch --all --recurse-submodules"
alias ,gitupdater="mr "

nmap(){
	docker run --rm --net=host gvangool/nmap "$@"
}

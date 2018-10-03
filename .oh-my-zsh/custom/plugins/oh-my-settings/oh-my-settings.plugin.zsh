alias ,ll='ls -alF'
alias ,dv='cd /Users/marek/work/src/vendavo'
alias ,dg='cd /Users/marek/git'
alias ,dt='cd /Users/marek/tmp'
alias ,openports="sudo lsof -i -P | grep -i 'listen'"
alias ,dock="ssh root@docker"
alias ,gitupdater2="find . -name .git -type d | xargs -n1 -P4 -I% git --git-dir=% --work-tree=%/.. fetch --all --recurse-submodules"
alias ,gitupdater="mr "

alias ,wifiscanarea="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s"
alias ,wificurrentap="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo"
alias ,wifisniff="sudo /usr/libexec/airportd en0 sniff"


nmap(){
	docker run --rm --net=host gvangool/nmap "$@"
}

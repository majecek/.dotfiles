_dev1() { ./vv81 dbuser new && ./vv81 dev1 -DskipTests=true  && ./jboss_home/server/vendavo-dev/bin/startJboss.sh debug && sleep 65 && ./vv81 dev2 && say "done done done" }
alias ,vall=_dev1


_cleanAndBuild() {
 cd '/Users/marek/work/src/vendavo' && rm -Rf ./classes ./scratch ./web ./jboss_home && ./vv81 dev1-noschema skipTests=true && ./jboss_home/server/vendavo-dev/bin/startJboss.sh debug
}
alias ,vCleanBuild=_cleanAndBuild

,vjbossHomeOnly() {./vv81 jboss-gen-startup-scripts}


,vjbossLogging() {
 cd '/Users/marek/.jenv/candidates/jboss/current/bin' && ./twiddle.sh -s localhost:1099 -u admin -p admin invoke "jboss.system:service=Logging,type=Log4jService" setLoggerLevel $1 "INFO"
}


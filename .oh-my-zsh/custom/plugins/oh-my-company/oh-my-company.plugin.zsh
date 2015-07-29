,vall() { 
./vv81 dbuser new 
./vv81 dev1 -DskipTests=true  
./jboss_home/server/vendavo-dev/bin/startJboss.sh debug & 
 sleep 60 
./vv81 dev2 
say "done done done" }

,vcleanAndBuild() { cd '/Users/marek/work/src/vendavo' && rm -Rf ./classes ./scratch ./web ./jboss_home && ./vv81 dev1-noschema skipTests=true && ./jboss_home/server/vendavo-dev/bin/startJboss.sh debug }

,vjbossHomeOnly() {./vv81 jboss-gen-startup-scripts}

,videv() {./vv81 idev-noschema && ./jboss_home/server/vendavo-dev/bin/startJboss.sh debug }

,vjbossLogging() {  cd '/Users/marek/.jenv/candidates/jboss/current/bin' && ./twiddle.sh -s localhost:1099 -u admin -p admin invoke "jboss.system:service=Logging,type=Log4jService" setLoggerLevel $1 "INFO" }

,jbossUsefullInfo() { cd '/Users/marek/.jenv/candidates/jboss/current/bin' && ./twiddle.sh -s 127.0.0.1:1099 get jboss.system:type=ServerInfo FreeMemory MaxMemory TotalMemory ActiveThreadCount }

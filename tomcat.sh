#!/bin/bash

# chkconfig: 2345 95 20
# description: this is the startup script for tomcat on system boot

ECHO=/bin/echo
TEST=/usr/bin/test
TOMCAT_USER=user
TOMCAT_HOME=/opt/apache-tomcat-7.0.55
TOMCAT_START_SCRIPT=$TOMCAT_HOME/bin/startup.sh
TOMCAT_STOP_SCRIPT=$TOMCAT_HOME/bin/shutdown.sh

$TEST -x $TOMCAT_START_SCRIPT || exit 0
$TEST -x $TOMCAT_STOP_SCRIPT || exit 0

start() {
	$ECHO -n "Starting Tomcat"
	su - $TOMCAT_USER -c "$TOMCAT_START_SCRIPT &"
	$ECHO "."
}

stop() {
	$ECHO -n  "Stopping Tomcat"
	su - $TOMCAT_USER -c "$TOMCAT_STOP_SCRIPT 60 -force &"
	while [ "$(ps -fu $TOMCAT_USER | grep java | grep tomcat | wc -l)" -gt "0" ]; do
           sleep 5; $ECHO -n "."
	done
	$ECHO "."
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		sleep 30
		start
		;;
	*)
		$ECHO "Usage: tomcat {start|stop|restart}"
		exit 1
esac
exit 0

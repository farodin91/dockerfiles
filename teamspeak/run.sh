#!/bin/bash

SERVER_DIR=/var/lib/teamspeak
DATA_DIR=/data

if [ ! -e $DATA_DIR/state ]; then
	mkdir $DATA_DIR/state/
fi

if [ ! -f $DATA_DIR/state/ts3server.sqlitedb ]; then
	touch $DATA_DIR/state/ts3server.sqlitedb
	ln -s $DATA_DIR/state/ts3server.sqlitedb $SERVER_DIR/ts3server.sqlitedb
fi

if [ ! -f $DATA_DIR/state/ts3server.ini  ]; then
	$SERVER_DIR/ts3server_minimal_runscript.sh \
	query_ip_whitelist="$DATA_DIR/state/query_ip_whitelist.txt" \
	query_ip_backlist="$DATA_DIR/state/query_ip_blacklist.txt" \
	logpath="$DATA_DIR/logs/" \
	licensepath="$DATA_DIR/state/" \
	inifile="$DATA_DIR/state/ts3server.ini" \
	createinifile=1 
else
	$SERVER_DIR/ts3server_minimal_runscript.sh inifile="$DATA_DIR/state/ts3server.ini" 
fi

$SERVER_DIR/ts3server_linux_amd64


if [ ! -e $DATA_DIR/logs ]; then
	mkdir $DATA_DIR/logs/
fi


#!/bin/bash

SERVER_DIR=/var/lib/teamspeak
DATA_DIR=/data
export LD_LIBRARY_PATH=$SERVER_DIR

if [ ! -e $DATA_DIR/state ]; then
	mkdir $DATA_DIR/state/
fi

echo "Database";

if [ ! -e $DATA_DIR/state/ts3server.sqlitedb ]; then
	touch $DATA_DIR/state/ts3server.sqlitedb
fi
if [ -e $DATA_DIR/state/ts3server.sqlitedb ]; then
	ln -s $DATA_DIR/state/ts3server.sqlitedb $SERVER_DIR/ts3server.sqlitedb
fi

echo "Blacklist";

if [ -e $DATA_DIR/state/query_ip_blacklist.txt ]; then
	ln -s $DATA_DIR/state/query_ip_blacklist.txt $SERVER_DIR/query_ip_blacklist.txt
fi

echo "Whitelist";

if [ -e $DATA_DIR/state/query_ip_whitelist.txt ]; then
	ln -s $DATA_DIR/state/query_ip_whitelist.txt $SERVER_DIR/query_ip_whitelist.txt
fi 

echo "files";

if [ ! -e $DATA_DIR/files ]; then
	mkdir $DATA_DIR/files/
fi
if [ -e $DATA_DIR/files ]; then
	ln -sfv $DATA_DIR/files $SERVER_DIR/files
fi

echo "logs";

if [ ! -e $DATA_DIR/logs ]; then
	mkdir $DATA_DIR/logs/
fi


if [ -e $DATA_DIR/ts3server.ini ]; then
	$SERVER_DIR/ts3server_minimal_runscript.sh start logpath=$DATA_DIR/logs/ inifile=$DATA_DIR/ts3server.ini
else
	$SERVER_DIR/ts3server_minimal_runscript.sh start logpath=$DATA_DIR/logs/ createinifile=1
fi

$SERVER_DIR/ts3server_linux_amd64
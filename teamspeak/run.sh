#!/bin/bash

SERVER_DIR=/var/lib/teamspeak
DATA_DIR=/data

if [ ! -e $DATA_DIR/state ]; then
	mkdir $DATA_DIR/state/
	touch $DATA_DIR/state/ts3server.sqlitedb
	ln -s $DATA_DIR/state/ts3server.sqlitedb $SERVER_DIR/ts3server.sqlitedb
fi

if [ ! -e $DATA_DIR/state ]; then
	mkdir $DATA_DIR/logs/
fi



SERVER_DIR=/var/lib/teamspeak
DATA_DIR=/data
export LD_LIBRARY_PATH=$SERVER_DIR
$SERVER_DIR/ts3server_linux_amd64
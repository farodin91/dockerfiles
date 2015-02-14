#!/bin/bash
DATA_DIR=/data
VERSION_MINE=1.7.10

if [ ! -e $DATA_DIR/forge.jar ]
	cp /tmp $DATA_DIR
fi

if [ ! -e $DATA_DIR/eula.txt ]; then
	if [ "$EULA" != "" ]; then
		echo "# Generated via Docker on $(date)" > eula.txt
		echo "eula=$EULA" >> eula.txt
	else
		echo ""
		echo "Please accept the Minecraft EULA at"
		echo " https://account.mojang.com/documents/minecraft_eula"
		echo "by adding the following immediately after 'docker run':"
		echo " -e EULA=true"
		echo ""
		exit 1
	fi
fi
java $JVM_OPTS -jar forge.jar
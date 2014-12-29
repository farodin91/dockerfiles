#!/bin/bash

if [ ! -e /data/eula.txt ]; then
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
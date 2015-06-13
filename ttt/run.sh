
if [ ! -e /opt/ttt/srcds_run ]; then
	bash /opt/steamcmd/steamcmd.sh \+login anonymous \+force_install_dir /opt/ttt \+app_update 4020 \+quit
fi
cp /opt/ttt/bin/libsteam.so /root/.steam/sdk32
/opt/ttt/srcds_run -console -maxplayers 16 +ip 192.168.x.x+ip 192.168.x.x -game garrysmod +gamemode terrortown +ip ${HOST_IP} +map gm_construct -authkey ${AUTH_KEY} +host_workshop_collection ${HOST_COLLECTION}
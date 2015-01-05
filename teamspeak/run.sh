SERVER_DIR=/var/lib/teamspeak
DATA_DIR=/data/config
export LD_LIBRARY_PATH=$SERVER_DIR
$SERVER_DIR/ts3server_linux_amd64 2>&1 | tee $DATA_DIR/logs/stderr.log
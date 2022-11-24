#!/bin/bash
LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "[${LOGTIME}] startup run..." >> start.log
service ssh start >> start.log
#!/bin/bash

set -e

echo "ftpuser:$FTP_PASSWD"
echo "ftpuser:password" | chpasswd

# exec vsftpd
sleep infinity

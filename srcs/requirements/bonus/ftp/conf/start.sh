#!/bin/bash

set -e

FTP_PASSWD=$(echo "$FTP_PASSWD" | sed 's/"//g')

echo "ftpuser:$FTP_PASSWD" | chpasswd

exec vsftpd /etc/vsftpd.conf

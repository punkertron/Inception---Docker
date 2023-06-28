#!/bin/bash

adduser ftpuser
echo "ftpuser:ftppass" | chpasswd
chown -R ftpuser:ftpuser /var/html/wordpress

/usr/sbin/vsftpd /etc/vsftpd.conf

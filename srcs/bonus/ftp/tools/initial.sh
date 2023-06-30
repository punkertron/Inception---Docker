#!/bin/bash

if [ ! -e "/etc/vsftpd.userlist" ]; then
	useradd $FTP_USER
	echo "$FTP_USER:$FTP_PASS" | chpasswd
	echo $FTP_USER > /etc/vsftpd.userlist
	mkdir -p /home/$FTP_USER/ftp

	echo "user_sub_token=$FTP_USER
	local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf
fi

/usr/sbin/vsftpd /etc/vsftpd.conf

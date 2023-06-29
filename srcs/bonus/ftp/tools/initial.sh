#!/bin/bash

useradd $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
#&> dev/null
echo $FTP_USER > /etc/vsftpd.userlist
mkdir -p /home/$FTP_USER/ftp

echo "user_sub_token=$FTP_USER
local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

/usr/sbin/vsftpd /etc/vsftpd.conf

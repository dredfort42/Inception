adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
echo $FTP_USER > /etc/vsftpd.users
mkdir -p /home/$FTP_USER/ftp

/usr/sbin/vsftpd /etc/vsftpd.conf
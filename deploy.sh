#!/bin/bash

yum update -y
amazon-linux-extras install php7.2
yum install -y httpd php php-mysqlnd
mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-$FSNAME.efs.$REGION.amazonaws.com:/ /var/www/html
systemctl enable httpd
systemctl start httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

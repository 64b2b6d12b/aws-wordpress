#!/bin/bash

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
rm -f latest.tar.gz
mv wordpress/* ./
rm -rf wordpress/

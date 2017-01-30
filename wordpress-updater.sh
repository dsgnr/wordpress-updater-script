#!/usr/bin/env bash
# @author: Daniel Hand
# http://www.designsbytouch.co.uk
# Created: 30/01/17

DATE=`date +%d-%m-%Y`
SITESTORE=/var/www
SITELIST=($(ls -lh $SITESTORE | awk '{print $9}'))

for SITE in ${SITELIST[@]};
do
cd $SITESTORE/$SITE
sudo wp core update --allow-root
wp core update-db --allow-root
sudo wp plugin update-all --allow-root
sudo wp theme update-all --allow-root
sudo wp db optimize --allow-root
done

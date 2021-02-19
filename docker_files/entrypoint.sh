#!/bin/bash

CONFIG_DIR="/etc/squid"
LOGIN=${WEBADMIN:-admin}
PASSWORD=${PASSWORD:-123456}


# Copy ddefault configs if neaded
if [ ! -f /etc/squid/squid.conf ];
then
	echo "Using default config";
	cp -rv /defaults/squid/* /etc/squid/;
fi;


chown squid:squid /var/cache/squid;
chmod ugo+w /dev/stdout /dev/stderr;


# Initialize directory for cache
[[ ! -d /var/cache/squid/00 ]] && \
	/usr/sbin/squid -Nz -f /etc/squid/squid.conf;


# Setup login and password
if [ -f ${CONFIG_DIR}/.htpasswd ];
then
	echo "using .htpasswd found in ${CONFIG_DIR}";
else
	echo "generatign .htpasswd in ${CONFIG_DIR}";
	echo "adding credentials: ${LOGIN}/${PASSWORD}";
	htpasswd -bcB ${CONFIG_DIR}/.htpasswd ${LOGIN} ${PASSWORD}
fi;

# Remove files from previous run
[ -f /var/run/squid.pid ] && echo "removing /var/run/squid.pid" && rm /var/run/squid.pid;

# Start squid
/usr/sbin/squid -NYCd 5 -f /etc/squid/squid.conf
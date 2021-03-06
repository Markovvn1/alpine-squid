FROM scratch

# Add root system, download it from https://alpinelinux.org/downloads/
ADD alpine-minirootfs-3.13.1-x86_64.tar.gz /
COPY docker_files /tmp/docker_files

RUN set -xe \
	# Install apache2-utils for the htpasswd utility
	&& apk add --no-cache --purge -uU apache2-utils squid bash \
	&& mkdir -p /defaults/squid \
	&& mv /etc/squid/* /defaults/squid \
	&& rm -rf /var/cache/apk/* \
	\
	&& mv /tmp/docker_files/entrypoint.sh / \
	&& mv /tmp/docker_files/squid.conf /defaults/squid/ \
	&& rm -rf /tmp/*

EXPOSE 3128 3129
ENTRYPOINT ["/entrypoint.sh"]

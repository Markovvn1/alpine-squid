# Alpine-Squid

Small container for Alpine Linux + Squid Proxy Server (20.2MB only)

### Get the Image

Pull it from docker hub
```
docker pull Markovvn1/alpine-squid
```

Or build from source
```
git clone https://github.com/Markovvn1/alpine-squid.git
cd alpine-squid
docker build -t markovvn1/alpine-squid .
```

### Run

Use docker-config.yaml to run the image
```
docker-compose up -d
```

### Configuring

Mount /etc/squid to get access to configs. All configuration is automatically copied to /etc/squid when docker starts. \
You can change login/password, ports or container name in docker-compose.yaml. \
Mount /var/cache/squid to get cache. 

### Proxy without password

To disable password you need to mount /etc/squid/squid.conf and modify it. You need to uncomment this lines:
```
# Allow to use proxy without authentication
# http_access allow localnet
# http_reply_access allow localnet
# icp_access allow localnet
# always_direct allow localnet
```

And comment this lines:
```
# Use proxy with authentication (.htpasswd) only
http_access allow authenticated localnet
http_reply_access allow authenticated localnet
icp_access allow authenticated localnet
always_direct allow authenticated localnet
```

### Shell access

Get a shell inside a already running container
```
docker exec -it docker_squid bash
```
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
docker build -t Markovvn1/alpine-squid .
```

### Run

Use docker-config.yaml to run the image
```
docker-compose up -d
```

### Configuring

Mount /etc/squid to get access to configs. All configuration is automatically copied to /etc/squid when docker starts.
You can change login/password, ports or container name in docker-compose.yaml.
Mount /var/cache/squid to get cache.

### Shell access

Get a shell inside a already running container
```
docker exec -it docker_squid bash
```
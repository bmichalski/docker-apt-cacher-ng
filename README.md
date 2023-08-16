# README

## Run test

```
DOCKER_BUILDKIT=1 \
docker-compose build && \
docker-compose up -d
```

```
docker exec -it apt_cacher_ng \
  tail -f /var/log/apt-cacher-ng/apt-cacher.log
```

```
cd tests
```

```
DOCKER_BUILDKIT=1 \
docker-compose build \
  --build-arg APT_CACHER_NG_HOST=localhost \
  --build-arg APT_CACHER_NG_PORT=3142 \
  --no-cache
```

```
docker-compose run apt_cacher_ng_test_client bash
```

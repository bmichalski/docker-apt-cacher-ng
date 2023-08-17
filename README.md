# README

## Start `apt_cacher_ng` service
```bash
docker compose build && \
docker compose up -d
```

## Read `apt_cacher_ng` service logs
```bash
docker exec -it apt_cacher_ng \
  tail -f /var/log/apt-cacher-ng/apt-cacher.log
```

## Build test client using `apt_cacher_ng` service

### Build test client
In `tests` subdirectory:
1. Build the test client once.
```bash
time docker compose build \
  --build-arg APT_CACHER_NG_HOST=localhost \
  --build-arg APT_CACHER_NG_PORT=3142 \
  --no-cache
```
2. Read the logs to see that files have been cached.
3. Build the test client once again. It should be faster.
2. Read the logs to see that cached files have been reused.

### Run bash command in `apt_cacher_ng` container
```bash
docker exec -it apt_cacher_ng bash
```

### List cached files in `apt_cacher_ng` container
```bash
docker exec -it apt_cacher_ng find /var/cache/apt-cacher-ng
```

## Stop services
In project root directory:
```bash
docker compose stop
```

## Remove stopped service containers
In project root directory:
```bash
docker compose rm
```

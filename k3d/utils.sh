#!/bin/bash

# brew install k3d

echo "=== RD engine (rd-engine.json) ==="
grep -E '"containerEngine":' "$HOME/Library/Application Support/rancher-desktop/rd-engine.json" || echo "No containerEngine key found"

echo
echo "=== Electron settings (if present) ==="
grep -E '"containerEngine":' "$HOME/Library/Application Support/rancher-desktop/electron/settings.json" 2>/dev/null || echo "No electron settings or key"

echo
echo "=== Docker socket state ==="
ls -l "$HOME/.docker/run/docker.sock" 2>/dev/null || echo "No docker.sock"
lsof -U "$HOME/.docker/run/docker.sock" 2>/dev/null | head -n 2 || echo "No process holds docker.sock"

echo
echo "=== Docker context & env ==="
echo "DOCKER_HOST=$DOCKER_HOST"
docker context show 2>/dev/null || true
docker context ls 2>/dev/null || true
docker context inspect rancher-desktop 2>/dev/null | jq '.[0].Endpoints' || true
docker context inspect desktop-linux 2>/dev/null | jq '.[0].Endpoints' || true

echo
echo "=== k3d state ==="


k3d version 2>/dev/null || true
k3d cluster list 2>/dev/null || true
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | grep '^k3d-' || echo "No k3d containers visible"
=== RD engine (rd-engine.json) ===
No containerEngine key found

=== Electron settings (if present) ===
No electron settings or key

=== Docker socket state ===
srwxr-xr-x  1 gshirazi  staff  0 Feb 18 11:20 /Users/gshirazi/.docker/run/docker.sock
COMMAND    PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
distnoted  714 gshirazi    3u  unix 0xb68460441507449e      0t0      ->0x88bb0421a901e01c

=== Docker context & env ===
DOCKER_HOST=
desktop-linux
NAME              DESCRIPTION                               DOCKER ENDPOINT                                  ERROR
default           Current DOCKER_HOST based configuration   unix:///var/run/docker.sock
desktop-linux *   Docker Desktop                            unix:///Users/gshirazi/.docker/run/docker.sock
rancher-desktop   Rancher Desktop moby context              unix:///Users/gshirazi/.rd/docker.sock
{
  "docker": {
    "Host": "unix:///Users/gshirazi/.rd/docker.sock",
    "SkipTLSVerify": false
  }
}
{
  "docker": {
    "Host": "unix:///Users/gshirazi/.docker/run/docker.sock",
    "SkipTLSVerify": false
  }
}

=== k3d state ===
k3d version v5.8.3
k3s version v1.33.6-k3s1 (default)
Cannot connect to the Docker daemon at unix:///Users/gshirazi/.docker/run/docker.sock. Is the docker daemon running?
No k3d containers visible

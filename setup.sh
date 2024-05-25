docker compose build
docker stack deploy -c docker-compose.yml web
yes | docker image prune


docker compose build
docker stack deploy -c docker-compose.yml web
yes | docker image prune > /dev/null
yes | docker container prune > /dev/null


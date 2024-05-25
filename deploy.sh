## ANTIGO

# image_name="service/app_rust"

# old_image=$(docker inspect $image_name --format {{.Id}})

# # docker compose down server
# docker compose up -d --no-deps --build server
# docker image rm $old_image -f

image_name="service/app_rust:latest"

# Removind old builds
yes | docker image prune > /dev/null
yes | docker container prune > /dev/null

docker compose build server

healh_cmd="curl -i http://localhost:5000/teste"
# --health-cmd "$healh_cmd" --health-timeout "$healh_timeout" --health-retries 0

docker service update web_server --image "$image_name" --force --no-resolve-image \
  --health-cmd "$healh_cmd" --health-timeout 5s --health-retries 1 --health-interval 3s


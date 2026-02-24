# interactive with tty and autoremoval
docker run --rm -it

# conainer ls
docker ps

# include stopped containers
docker ps --all

# remove stopped containers
docker container prune

# docker container stats
docker stats

# docker image ls
docker images

# inspect image
docker image inspect

# inspect container
docker container inspect

# show docker disk usage report
docker system df

# remove all stopped containers
docker container prune

# remove dangling images
docker image prune

# remove unused data (build cache + images + containers)
docker system prune

# completely remove data (build cache + images + containers)
docker system prune -a

# resolve docker compose configuration
docker compose config | bat -l yaml

# disable docker compose cache
export COMPOSE_CACHE_DISABLE=1

# build without buildx (enabled if docker-buildx package is installed)
docker build --progress=plain .

# remove all build cache
docker builder prune --all


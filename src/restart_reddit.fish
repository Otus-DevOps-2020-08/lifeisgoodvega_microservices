#!/opt/local/bin/fish
eval (docker-machine env docker-host)
docker kill (docker ps -q)

docker run -d --network=reddit --network-alias=for_posts --network-alias=for_comments -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post_service --env POST_DATABASE_HOST=for_posts lifeisgoodvega/post:1.0
docker run -d --network=reddit --network-alias=comment_service --env COMMENT_DATABASE_HOST=for_comments lifeisgoodvega/comment:1.0
docker run -d --network=reddit -p 9292:9292 --env POST_SERVICE_HOST=post_service --env COMMENT_SERVICE_HOST=comment_service lifeisgoodvega/ui:1.0

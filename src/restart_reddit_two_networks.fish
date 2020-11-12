#!/opt/local/bin/fish
eval (docker-machine env docker-host)
docker kill (docker ps -q)

docker run -d --network=back_net --network-alias=post_db --network-alias=comment_db  --name mongo_db -v reddit_db:/data/db mongo:latest
docker run -d --network=back_net --network-alias=post  --name post lifeisgoodvega/post:1.0
docker run -d --network=back_net --network-alias=comment  --name comment lifeisgoodvega/comment:1.0
docker run -d --network=front_net -p 9292:9292  --name ui lifeisgoodvega/ui:1.0

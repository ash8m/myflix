# RESTful MongoDB

## security
MongoDB is abstracted behind the RESTHeart HTTP microservice. MongoDB is spawned in a separate docker network and network access is restricted and allowed only to RESTHeart service. Access to RESTHeart microservice is secured with password based authentication. Other authentication option can be explored using https://restheart.org/docs/security/authentication

## running the service
To run RESTHeart and MongoDB, run the docker-compose file using the command:\
$ sudo docker compose up\
Docker compose file is taken from the open source code provided at https://github.com/SoftInstigate/restheart/blob/master/docker-compose.yml \
\
The database and video collections needs to be created. This is done using the RESTHeart service.\
Set the username and password as environmet variables. Here the default user and password is used: \
BASIC_AUTH_PASSWORD=secret\
BASIC_AUTH_USER=admin\
AUTH=$(echo -ne "$BASIC_AUTH_USER:$BASIC_AUTH_PASSWORD" | base64 --wrap 0)\
referred from https://stackoverflow.com/a/53630834 \
\
Create the collection videos:\
curl -i 
--header "Content-Type: application/json" 
--header "Authorization: Basic $AUTH" 
--request PUT 
http://localhost:8080/videos \
\
Insert documents:\
curl -i 
--header "Content-Type: application/json" 
--header "Authorization: Basic $AUTH" 
--request POST 
--data "@videos.json" 
http://localhost:8080/videos \
referred from https://stackoverflow.com/questions/6408904/send-request-to-curl-with-post-data-sourced-from-a-file


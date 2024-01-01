Build the docker image from the Dockerfile by running:
$ docker build -t videoserver

Run the container with the following command:
$ sudo  docker run -it  -d -p 8081:80 --name web -v ~/mp4/:/var/mp4/ -v ~/www/:/var/www/ nginx


Build the docker image from the Dockerfile by running:
$ docker build -t videoserver

Upload the mp4 files and their thumbnails to mp4 and www/pics directories in the host so that these can be mounted on the container when it is brought up.

Run the container with the following command:
$ sudo  docker run -it  -d -p 8081:80 --name web -v $PWD/mp4/:/var/mp4/ -v $PWD/www/:/var/www/ videoserver


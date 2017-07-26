ECHO OFF

ECHO Running multiple containers for an image

docker run -it -d --rm --name ubuntu1 ubuntu /bin/bash
docker run -it -d --rm --name ubuntu2 ubuntu /bin/bash
docker run -it -d --rm --name ubuntu3 ubuntu /bin/bash
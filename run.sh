#!/bin/sh

echo Running multiple containers for an image

docker run -it -d --rm --platform=linux --name ubuntu1 ubuntu /bin/bash
docker run -it -d --rm --platform=linux --name ubuntu2 ubuntu /bin/bash
docker run -it -d --rm --platform=linux --name ubuntu3 ubuntu /bin/bash
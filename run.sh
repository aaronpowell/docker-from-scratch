#!/bin/bash

echo Building app

docker build -t dfs-scratch --rm .

echo Running container

docker run --rm dfs-scratch

docker image ls

docker rmi dfs-scratch
docker image prune -f
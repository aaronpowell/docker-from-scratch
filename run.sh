#!/bin/bash

echo Building app

docker run --rm -v "$(pwd)"/src:/src -w /src golang:1.8 go build -v -o app

echo Creating image

docker build -t dfs-scratch -f Dockerfile.run .

echo Running container

docker run --rm dfs-scratch

docker rmi dfs-scratch
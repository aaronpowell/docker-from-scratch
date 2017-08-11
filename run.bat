ECHO OFF

ECHO Building app

docker run --rm -v %CD%/src:/src -w /src golang:1.8 go build -v -o app

ECHO Creating image

docker build -t dfs-scratch -f Dockerfile.run .

ECHO Running container

docker run --rm dfs-scratch

docker rmi dfs-scratch
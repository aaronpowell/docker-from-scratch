#!/bin/sh

echo building the application

cd src

dotnet restore ./DemoApp.sln
dotnet publish ./DemoApp.sln -c Release -o ./DemoApp/obj/Docker/publish

echo creating the image

docker build -t step12 --build-arg source=obj/Docker/publish ./DemoApp

echo creating network

docker network create step12_web
docker network create step12_sql

echo starting containers

docker run --rm -d --network step12_web -p 1337:80 --name web -e ASPNETCORE_ENVIRONMENT=Development step12
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" --network step12_sql -d --name sql microsoft/mssql-server-linux

read -p "Add web to sql network"

docker network connect step12_sql web

read

echo cleanup

docker stop web
docker stop sql
docker rm sql
docker network rm step12_web
docker network rm step12_sql

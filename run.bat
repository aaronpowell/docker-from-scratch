ECHO OFF

ECHO building the application

cd src

dotnet restore ./DemoApp.sln
dotnet publish ./DemoApp.sln -c Release -o ./obj/Docker/publish

ECHO creating the image

docker build -t step12 ./DemoApp

ECHO creating network

docker network create step12_web
docker network create step12_sql

ECHO starting containers

docker run --rm -d --network step12_web -p 1337:80 --name web -e ASPNETCORE_ENVIRONMENT=Development step12
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" --network step12_sql -d --name sql microsoft/mssql-server-linux

docker network connect step12_sql web

PAUSE

ECHO cleanup

docker stop web
docker stop sql
docker rm sql
docker network rm step12_web
docker network rm step12_sql

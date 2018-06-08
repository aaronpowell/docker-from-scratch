ECHO OFF

ECHO building the application

cd src

dotnet restore ./DemoApp.sln
dotnet publish ./DemoApp.sln -c Release -o ./obj/Docker/publish

ECHO creating the image

docker build -t step11 ./DemoApp

ECHO creating network

docker network create step11

ECHO starting containers
docker run --rm -d --network step11 -p 1337:80 --name web -e ASPNETCORE_ENVIRONMENT=Development step11
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 --network step11 -d --name sql microsoft/mssql-server-linux

PAUSE

ECHO cleanup

docker stop web
docker stop sql
docker rm sql
docker network rm step11

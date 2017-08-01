ECHO OFF

ECHO running sql server

docker-compose -f ./docker-compose.yml up sql

docker-compose rm -f
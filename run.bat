ECHO OFF

ECHO nodejs image

docker run -it --rm --name node -d -v %CD%:/src -w /src -p 8080:3000 node:7.7.4-alpine node app.js
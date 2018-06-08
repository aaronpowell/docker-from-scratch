ECHO OFF

ECHO nodejs image

docker run --platform=linux -it --rm --name node -d -v %CD%:/src -w /src node:7.7.4-alpine node app.js
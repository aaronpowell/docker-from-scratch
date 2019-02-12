ECHO OFF

ECHO nodejs image

docker run --platform=linux -it --rm --name node -d -v %CD%:/src -w /src -p 8080:3000 node:11.9.0-alpine node app.js
#!/bin/bash

echo nodejs image

docker run --platform=linux -it --rm --name node -d -v "$(pwd):/src" -w /src -p 8080:3000 node:7.7.4-alpine node app.js
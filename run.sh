#!/bin/bash

echo nodejs image

docker build --platform=linux -t nodejs-app .

docker run --platform=linux --rm -p 8080:3000 -d nodejs-app
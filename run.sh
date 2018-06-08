#!/bin/bash

echo nodejs image

docker run --platform=linux -it --rm --name node node:7.7.4-alpine
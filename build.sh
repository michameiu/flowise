#/bin/bash
set -e
IMAGE=michameiu/flowise
VERSION=v2.1.1

echo "Building $IMAGE:$VERSION"
# python3 manage.py test

# git push origin main

docker build -t $IMAGE:$VERSION . --platform=linux/amd64
# docker tag  $IMAGE:$VERSION  $IMAGE:latest

docker build -t $IMAGE:$VERSION.arm . --platform=linux/arm64 --progress=plain

docker push $IMAGE:$VERSION
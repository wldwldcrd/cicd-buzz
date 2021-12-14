#!/bin/sh

cat mypassword.txt | docker login registry-1-stage.docker.io -u wldwldcrd --password-stdin
#cat mypassword.txt | docker login -u $DOCKER_USER --password-stdin

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker push $TRAVIS_REPO_SLUG
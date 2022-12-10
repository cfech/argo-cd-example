#!/bin/zsh

echo $1

docker build -t "cfech/argo_example:${1}" ./example_project

docker login

docker push "cfech/argo_example:${1}"
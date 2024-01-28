#!/bin/sh

# NOTE: Requires:
#     docker pull pandoc/latex

docker run \
    --rm \
    -v "$(pwd):/data" \
    -u $(id -u):$(id -g) \
    pandoc/latex \
    -s \
    -V geometry:a4paper,margin=1cm \
    -V colorlinks=true \
    cv.md \
    -o cv.pdf

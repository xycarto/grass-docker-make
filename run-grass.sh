#!/bin/bash

PROJECTION=$1

GRASS_DIR="grass"

if [ -d ${GRASS_DIR} ];
then
    rm -rf ${GRASS_DIR}
    mkdir ${GRASS_DIR}
    grass -c epsg:$PROJECTION -e grass/GRASS_ENV
else
    mkdir ${GRASS_DIR}
    grass -c epsg:$PROJECTION -e grass/GRASS_ENV
fi

grass grass/GRASS_ENV/PERMANENT --exec bash grass-script.sh
# GRASS GIS, Docker, Makefile
Small example of using Docker and Makefile to implement GRASS GIS.

## Requirements

```
docker
```

## Summary

This is a basic example of setting up scripted GRASS process through a Docker image and using a `makefile` to launch the process. The goal is remove the need to install GRASS on your machine and fully containerize the process.

Included in the repo is the main `Dockerfile` to build GRASS, plus a few extra geospatial bits like `GDAL`, `geospandas`, and `rasterio`. 

It is expected that users have a small familiarity with Docker, Make, and GRASS.  

## What this repo does

In short, the repo is built to launch a GRASS environment and call a script with the users grass commands.  Ideally, users should be able to clone the repo, build the Docker locally (or pull it), and run a simple `make` command calling the primary script to perform the GRASS operations.

**Important**
Each time the script is run, the intial operation is to check if a GRASS environment exists. If so, that environment is destroyed and new environment is built.  This method is developed for scripting purposes and not intended for saving data in your GRASS env.

## Methods

**Build GRASS Docker**

```
make docker-local
```

**Run GRASS script**

Note: users can implement any projection here using the ESPG value. The following is building a GRASS environment in New Zealand Transverse Mercator (NZTM), EPSG:2193

```
make grass-project proj="2193"
```

This should output the GRASS version installed in the Docker

## Modifications

Users can implement any GRASS commands and methods in the `run-grass.sh` script, simply by modifying the file.
FROM  ubuntu:22.04

ENV TZ Pacific/Auckland

RUN apt-get update
RUN apt-get install -y tzdata
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update &&  \
    apt-get install -y --no-install-recommends gnupg ca-certificates software-properties-common dirmngr wget \
    curl git-core libssl-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install pip3 and compilation tools
RUN apt-get update && \
	apt-get install -y python3-pip && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install GDAL
RUN apt-get update && \
	apt-get install -y gdal-bin libgdal-dev && \
    apt upgrade --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Python packages
RUN apt-get update && apt-get -y install python3-pip
RUN pip3 install boto3 geopandas rasterio --upgrade --force-reinstall
RUN pip3 install koordinates
RUN pip3 install awscli 

RUN apt-get update && apt-get -y install grass-core grass-dev
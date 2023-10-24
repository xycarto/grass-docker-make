

BASEIMAGE := xycarto/grass-basic
IMAGE := $(BASEIMAGE):2023-10-24

RUN ?= docker run -it --rm --net=host --user=$$(id -u):$$(id -g) \
	-e DISPLAY=$$DISPLAY \
	-e HOME=/work \
	-e RUN= -v$$(pwd):/work \
	-w /work $(IMAGE)

.PHONY: 

##### RUN GRASS #####
# make grass-project proj="2193"
grass-project:
	$(RUN) bash run-grass.sh $(proj)

##### DOCKER #####
test-local: docker/Dockerfile
	docker run -it --rm  \
	--user=$$(id -u):$$(id -g) \
	-e DISPLAY=$$DISPLAY \
	-e RUN= -v$$(pwd):/work \
	-w /work $(IMAGE)
	bash
	
docker-local: Dockerfile
	docker build --tag $(BASEIMAGE) - < Dockerfile  && \
	docker tag $(BASEIMAGE) $(IMAGE)

docker-pull:
	docker pull $(IMAGE)
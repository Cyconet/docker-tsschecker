IMAGE_NAME := waja/tsschecker

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! [ "$$(docker run --rm -it $(IMAGE_NAME) -h | head -2 | tail -1 | cut -d' ' -f2)" = "tsschecker" ]; then exit 1; fi

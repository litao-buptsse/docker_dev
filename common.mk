IMAGE=$(IMAGE_MAIN_NAME):$(IMAGE_VERSION)

ifdef NO_CACHE
    BUILD_PARAM='--no-cache=true'
else
    BUILD_PARAM=
endif

all: build

build:
	docker build $(BUILD_PARAM) -t $(IMAGE_MAIN_NAME) .

push: build
	docker tag -f $(IMAGE_MAIN_NAME) $(REGISTORY)/$(IMAGE) && docker push $(REGISTORY)/$(IMAGE)

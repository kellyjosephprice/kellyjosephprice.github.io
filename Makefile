IMAGE_NAME = klog
JEKYLL_RUN_DEFAULTS = docker run --rm -it \
	--volume="$(PWD):/srv/jekyll"

image:
	docker build -t $(IMAGE_NAME) .

shell: image
	$(JEKYLL_RUN_DEFAULTS) $(IMAGE_NAME) bash

serve: image
	(sleep 10 && xdg-open http://penguin.termina.linux.test:4000) &
	$(JEKYLL_RUN_DEFAULTS) -p 4000:4000 $(IMAGE_NAME)

JEKYLL_RUN_DEFAULTS = docker run --rm -it \
	--volume="$(PWD):/srv/jekyll" \
	-p 4000:4000

image:
	docker build -t jekyll .

shell: image
	$(JEKYLL_RUN_DEFAULTS) jekyll bash

server: image
	(sleep 1 && xdg-open http://penguin.termina.linux.test:4000) &
	$(JEKYLL_RUN_DEFAULTS) jekyll bash -c "jekyll serve --host 0.0.0.0"

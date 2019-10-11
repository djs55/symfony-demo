# The php files are bind-mounted so access is fast.
fast: pull
	docker run --rm --name symfony-demo -p 8080:8080 djs55/symfony-demo

# The php files are mounted from the host so access is slow.
slow: pull www
	docker run --rm --name symfony-demo -p 8080:8080 -v $(shell pwd)/www:/var/www djs55/symfony-demo

pull:
	docker pull djs55/symfony-demo

# extract the php files from the image so they can be edited locally
www:
	docker run djs55/symfony-demo tar -c -C /var www | tar x

# If you want to build manually, rather than pull from docker hub:
build:
	docker build -t djs55/symfony-demo .

.PHONY: pull build fast slow

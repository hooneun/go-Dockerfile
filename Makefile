docker-build:
	docker build . -t flyio-test

docker-run:
	docker run -p 3000:1323 flyio-test


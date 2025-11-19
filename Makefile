
build:
	docker build -t nathaly:1.0.1 .

deploy:
	docker stack deploy --with-registry-auth -c stack.yml doraemon


rm:
	docker stack rm doraemon


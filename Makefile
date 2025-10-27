CONTAINER_NAME = mysql-9.5.0
MYSQL_IMAGE = mysql:9.5.0
MYSQL_ROOT_PASSWORD = secret

all: go-run

mysql-run:
	docker run --name $(CONTAINER_NAME) -p 3306:3306 -e MYSQL_ROOT_PASSWORD=$(MYSQL_ROOT_PASSWORD) -d $(MYSQL_IMAGE)

mysql-remove:
	docker rm -f $(CONTAINER_NAME)

mysql-start:
	docker start $(CONTAINER_NAME)

mysql-stop:
	docker stop $(CONTAINER_NAME)

mysql-shell-root:
	docker exec -it $(CONTAINER_NAME) mysql -u root -p

mysql-shell-user:
	docker exec -it $(CONTAINER_NAME) mysql -u gopher -p recordings

go-run:
	go run .

.PHONY: mysql-run mysql-remove mysql-start mysql-stop mysql-shell go-run mysql-shell-root mysql-shell-user

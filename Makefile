all:
	@mkdir -p /home/dredfort/data/mysql /home/dredfort/data/html /home/dredfort/data/logs
	docker-compose -f ./srcs/docker-compose.yml up -d

ps:
	docker-compose -f ./srcs/docker-compose.yml ps
	@echo "------------------------------------------"
	docker volume ls
	@echo "------------------------------------------"
	docker network ls 

down:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: down
	docker network prune -f
	docker volume rm $$(docker volume ls -q)
	docker rmi $$(docker images -q)
	sudo rm -rf /home/dredfort/data

	@# docker kill $$(docker ps -q)
	@# docker rm $$(docker ps -a -q)
	@# docker network rm $$(docker network ls -q)
	@# docker volume prune -f
	@# docker image prune -f


docker:
	@cp ./srcs/requirements/tools/docker_setup.sh /home/dredfort/docker_setup.sh
	@chmod 777 /home/dredfort/docker_setup.sh
	@cp ./srcs/requirements/tools/docker_test.sh /home/dredfort/docker_test.sh
	@chmod 777 /home/dredfort/docker_test.sh
	@sudo rm -rf /home/dredfort/data
	@mkdir -p /home/dredfort/data/mysql /home/dredfort/data/html /home/dredfort/data/logs
	bash /home/dredfort/docker_setup.sh
	bash /home/dredfort/docker_test.sh
	@rm /home/dredfort/docker_setup.sh /home/dredfort/docker_test.sh
	make all

PONY: all ps down fclean docker
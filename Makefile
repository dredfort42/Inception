all:
	@mkdir -p /home/dredfort/data/mysql /home/dredfort/data/html /home/dredfort/data/portainer
	docker-compose -f ./srcs/docker-compose.yml up -d

ps:
	docker-compose -f ./srcs/docker-compose.yml ps
	@echo "------------------------------------------"
	docker volume ls
	@echo "------------------------------------------"
	docker network ls 

down:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: 
	@sudo chmod 777 /home/dredfort/Inception/srcs/requirements/tools/fclean.sh
	@bash /home/dredfort/Inception/srcs/requirements/tools/fclean.sh 2> /dev/null

docker:
	@chmod 777 /home/dredfort/Inception/srcs/requirements/tools/docker_setup.sh
	@chmod 777 /home/dredfort/Inception/srcs/requirements/tools/docker_test.sh
	@sudo rm -rf /home/dredfort/data
	@mkdir -p /home/dredfort/data/mysql /home/dredfort/data/html /home/dredfort/data/portainer
	bash /home/dredfort/Inception/srcs/requirements/tools/docker_setup.sh
	bash /home/dredfort/Inception/srcs/requirements/tools/docker_test.sh
	make all

PONY: all ps down fclean docker
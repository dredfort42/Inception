sudo docker run hello-world
sleep 3
echo
echo -e "\033[32m [19] DOCKER TEST COMPLITED ####################   \033[0m"
echo
mkdir docker_test
sleep 1
cd docker_test
yml=$(sudo cat docker-compose.yml | wc -l)
if [ "$yml" = "$empty" ]
then
    echo "services: 
        php: 
            image: \"php:7-fpm\"
        web: 
            image: \"nginx:latest\"
            links: 
            - php
            ports: 
            - \"8080:80\"" >> docker-compose.yml
fi
sleep 3
clear
docker-compose up -d
sleep 3
echo
docker ps -a
cd ..
echo
echo -e "\033[32m [20] DOCKER COMPOSE TEST COMPLITED ####################   \033[0m"
echo
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
sudo rm -rf docker_test
echo
echo -e "\033[32m [21] DOCKER TEST DATA ERRASED ####################    \033[0m"
echo

sleep 1
clear
echo
echo
echo
echo -e "\033[32m      #############################################    \033[0m"
echo -e "\033[32m      #                                           #    \033[0m"
echo -e "\033[32m      #           SYSTEM IS READY TO GO           #    \033[0m"
echo -e "\033[32m      #                                           #    \033[0m"
echo -e "\033[32m      #############################################    \033[0m"
echo
echo
echo
sleep 3
clear
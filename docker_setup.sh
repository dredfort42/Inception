empty=0

sudo apt update -y
echo
echo "[1] SYSTEM UPDATED ####################"
echo
sudo apt install wget -y
echo
echo "[2] WGET INSTALLED ####################"
echo
sudo apt install apt-transport-https -y
echo
echo "[3] HTTPS TRANSPORT INSTALLED ####################"
echo
sudo apt install ca-certificates -y
echo
echo "[4] CA CERTIFICATES INSTALLED ####################"
echo
sudo apt install software-properties-common -y
echo
echo "[5] COMMON PROPERTIES INSTALLED ####################"
echo
sudo apt install curl -y
echo
echo "[6] CURL INSTALLED ####################"
echo
sudo apt install gnupg2 -y
echo
echo "[7] GNU PG INSTALLED ####################"
echo
sudo rm -f /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
echo
echo "[8] GPG KEY ADDED ####################"
echo
repository=$(sudo cat /etc/apt/sources.list | grep https://download.docker.com/linux/debian | wc -l)
if [ "$repository" = "$empty" ]
then
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
fi
sudo cat -e /etc/apt/sources.list | grep docker
echo
echo "[9] DOCKER REPOSITORY ADDED ####################"
echo
sudo apt update -y
echo
echo "[10] SYSTEM UPDATED ####################"
echo
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
echo
echo "[11] DOCKER INSTALLED ####################"
echo
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
sudo chmod 777 docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo rm docker-compose-linux-x86_64.sha*
echo
echo "[12] DOCKER COMPOSE INSTALLED ####################"
echo
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
echo
echo "[13] DOCKER SERVICE ENABLED ####################"
echo
sudo systemctl status docker | cat
echo
echo "[14] DOCKER STATUS CHECKED ####################"
echo
sudo chmod 777 /var/run/docker.sock
group=$(groups | grep docker | wc -l)
if [ "$group" = "$empty" ]
then
    sudo groupadd docker
fi
sudo usermod -aG docker ${USER}
echo
echo "[15] $USER ADDED TO DOCKER GROUP ####################"
echo
docker version
echo
echo "[16] DOCKER VERSION PRINTED ####################"
echo
docker-compose version
echo
echo "[17] DOCKER COMPOSE VERSION PRINTED ####################"
echo
sudo curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
source /etc/bash_completion.d/docker-compose
echo
echo "[18] COMMAND-LINE COMPLETION CONFIGURED ####################"
echo
echo "--------------------"
echo
sudo docker run hello-world
echo "--------------------"
sleep 3
echo
echo "[19] DOCKER TEST COMPLITED ####################"
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
echo "--------------------"
sleep 3
docker-compose up -d
echo "--------------------"
sleep 3
docker ps -a
cd ..
echo
echo "[20] DOCKER COMPOSE TEST COMPLITED ####################"
echo
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
sudo rm -rf docker_test
echo
echo "[21] DOCKER TEST DATA ERRASED ####################"
echo
git=$(ls -la | grep Inception | wc -l)
if [ "$git" = "$empty" ]
then
    git clone https://github.com/dredfort42/Inception.git
else
    cd Inception/
    git pull
    cd ..
fi
rm Inception/docker_setup.sh

# make up


# sleep 1
# clear
# echo
# echo
# echo
# echo "      ##############################################"
# echo "      #                                            #"
# echo "      #          SYSTEM WILL BE RESTARTED          #"
# echo "      #                                            #"
# echo "      ##############################################"
# echo
# echo
# echo
# sleep 3
# sudo reboot
empty=0

sudo apt update -y
echo
echo -e "\033[32m [1] SYSTEM UPDATED ####################   \033[0m"
echo
sudo apt install wget -y
echo
echo -e "\033[32m [2] WGET INSTALLED ####################   \033[0m"
echo
sudo apt install apt-transport-https -y
echo
echo -e "\033[32m [3] HTTPS TRANSPORT INSTALLED ####################    \033[0m"
echo
sudo apt install ca-certificates -y
echo
echo -e "\033[32m [4] CA CERTIFICATES INSTALLED ####################    \033[0m"
echo
sudo apt install software-properties-common -y
echo
echo -e "\033[32m [5] COMMON PROPERTIES INSTALLED ####################  \033[0m"
echo
sudo apt install curl -y
echo
echo -e "\033[32m [6] CURL INSTALLED ####################   \033[0m"
echo
sudo apt install gnupg2 -y
echo
echo -e "\033[32m [7] GNU PG INSTALLED #################### \033[0m"
echo
sudo rm -f /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
echo
echo -e "\033[32m [8] GPG KEY ADDED ####################    \033[0m"
echo
repository=$(sudo cat /etc/apt/sources.list | grep https://download.docker.com/linux/debian | wc -l)
if [ "$repository" = "$empty" ]
then
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
fi
sudo cat -e /etc/apt/sources.list | grep docker
echo
echo -e "\033[32m [9] DOCKER REPOSITORY ADDED ####################  \033[0m"
echo
sudo apt update -y
echo
echo -e "\033[32m [10] SYSTEM UPDATED ####################  \033[0m"
echo
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
echo
echo -e "\033[32m [11] DOCKER INSTALLED ####################    \033[0m"
echo
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
sudo chmod 777 docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo rm docker-compose-linux-x86_64.sha*
echo
echo -e "\033[32m [12] DOCKER COMPOSE INSTALLED ####################    \033[0m"
echo
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
echo
echo -e "\033[32m [13] DOCKER SERVICE ENABLED ####################  \033[0m"
echo
sudo systemctl status docker | cat
echo
echo -e "\033[32m [14] DOCKER STATUS CHECKED ####################   \033[0m"
echo
sudo chmod 777 /var/run/docker.sock
group=$(groups | grep docker | wc -l)
if [ "$group" = "$empty" ]
then
    sudo groupadd docker
fi
sudo usermod -aG docker ${USER}
sudo systemctl start docker
echo
echo -e "\033[32m [15] $USER ADDED TO DOCKER GROUP #################### \033[0m"
echo
docker version
echo
echo -e "\033[32m [16] DOCKER VERSION PRINTED ####################  \033[0m"
echo
docker-compose version
echo
echo -e "\033[32m [17] DOCKER COMPOSE VERSION PRINTED ####################  \033[0m"
echo
sudo curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
source /etc/bash_completion.d/docker-compose
echo
echo -e "\033[32m [18] COMMAND-LINE COMPLETION CONFIGURED ####################  \033[0m"
echo

# git=$(ls -la | grep Inception | wc -l)
# if [ "$git" = "$empty" ]
# then
#     git clone https://github.com/dredfort42/Inception.git
# else
#     cd Inception/
#     git pull
#     cd ..
# fi


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

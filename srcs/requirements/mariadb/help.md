CHECK DATABASE CONTAINER

# at mariadb container console:
mysql -h localhost -u dredfort -p -e "show databases;"

# at other container console:
mysql -h mariadb -u dredfort -p -e "show databases;"

CREATE DATABASE inception_db;
CREATE USER 'dredfort'@'%' IDENTIFIED BY 'dredfort.42';
GRANT ALL PRIVILEGES ON inception_db.* TO 'dredfort'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root.42';
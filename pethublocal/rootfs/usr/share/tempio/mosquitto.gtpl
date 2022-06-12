# Pet Hub Mosquitto Config
#

protocol mqtt
user root
log_dest stdout
log_type error
log_type warning
log_type notice
log_type information

persistence true
persistence_location data

connection PetHubLocal
address addon_core_mosquitto:1883

remote_username pethublocal
remote_password {{ .broker_password }}

topic pethub/ha/# both 0
topic homeassistant/+/pethub/# both 0

listener 1883
protocol mqtt
allow_anonymous true

listener 8883
protocol mqtt
allow_anonymous true
cafile /etc/mosquitto/AmazonRootCA1.pem
certfile /etc/mosquitto/hub.pem
keyfile /etc/mosquitto/hub.key

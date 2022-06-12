#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures mosquitto
# ==============================================================================
declare broker_hostname
declare broker_username
declare broker_password

broker_hostname="$(bashio::config 'broker_hostname')"
broker_username="$(bashio::config 'broker_username')"
broker_password="$(bashio::config 'broker_password')"

# Generate mosquitto configuration.
bashio::var.json \
  broker_hostname "${broker_hostname}" \
  broker_username "${broker_username}" \
  broker_password "${broker_password}" \
  | tempio \
    -template /usr/share/tempio/mosquitto.gtpl \
    -out /etc/mosquitto/mosquitto.conf

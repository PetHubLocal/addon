#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures mosquitto
# ==============================================================================
declare broker_password

broker_password="$(bashio::config 'broker_password')"

# Generate mosquitto configuration.
bashio::var.json \
  broker_password "${broker_password}" \
  | tempio \
    -template /usr/share/tempio/mosquitto.gtpl \
    -out /etc/mosquitto/mosquitto.conf

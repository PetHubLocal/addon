# Home Assistant Add-on: PetHubLocal

Documentation: https://pethublocal.github.io/

Code: https://github.com/PetHubLocal/pethublocal

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Add Pet Hub Local Addon Repo: 
3. Find the "PetHubLocal" addon and click it.
4. Click on the "INSTALL" button.

## Configuration

Add-on configuration:

Navigate to the Mosquitto Addon and change the port from 8883 to 8882 for the TLS enpoint.
Add a local user to the broker by adding the following under the `login` section.

```
 - username: pethublocal
   password: pethublocal
```

You can also set a different password in the Mosquitto addon password and match it to the broker_password variable in the PetHubLocal addon

This is so the broker in PetHubLocal can connect to the main Mosquitto broker with a username and password, and also updating the port as the Hub needs to connect on port 8883 with Client Certificate auth which isn't supported in the main Mosquitto broker.

You then need to add your SurePetCare Cloud EMail Address and Password to download everything.

- broker_password: This is the password for logging into the MQTT Broker

```yaml
username: email@address.com
password: secretpassword
broker_password: pethublocal
```

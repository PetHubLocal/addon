# Home Assistant Add-on: Pet Hub Local

Documentation: https://pethublocal.github.io/

Code: https://github.com/PetHubLocal/pethublocal

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in Home Assistant to **Settings** -> **Add-ons** -> **Add-on Store**.
2. Up the top right with the 3 Dots select **Repositories** 
3. Add PetHubLocal Addon Repository: https://github.com/PetHubLocal/addon
4. In the Add-on Store a new repository **PetHubLocal Home Assistant Add-on** has now been added to the bottom so find the "Pet Hub Local" addon and click it.
5. Click on the "INSTALL" button.
6. **WAIT** as it can take up to 7 minutes for the add-on to deploy as it needs to download the Home Assistant Docker image, install OS packages and PIP install all the python packages. It takes a while so just get a coffee or something rather than navigating away from the install screen.

## Configuration

The configuration requires two changes to the `core_mosquitto` configuration and configuring the add-on as well.

### Core Mosquitto add-on configuration

1. Add a new local user for the PetHubLocal broker to be able to authenticate to the core broker by adding the following under the Logins section. THis is because the core Mosquitto broker requires authentication which is an issue as the Hub doesn't support MQTT authentication. So the addon includes a Mosquitto broker and connects to the core broker as a remote broker with a username and password.


 - Add `pethublocal` user to the core broker by adding the following under the `login` section.
```
 - username: pethublocal
   password: pethublocal
```

 - Update the TLS port from `8883` to anything else such as `8882` so then the PetHubLocal Broker can listen for the Hub MQTT messages on port `8883` not the core broker.

You can also set a different password in the Mosquitto addon password and match it to the `broker_password` variable in the PetHubLocal addon but it defaults to pethublocal.

### PetHubLocal add-on configuration

You then need to add your SurePetCare Cloud EMail Address and Password to download everything.

- broker_password: This is the password for logging into the Core Mosquitto Broker so needs to match the above password.

```yaml
username: email@address.com
password: secretpassword
broker_password: pethublocal
```

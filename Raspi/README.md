# This folder contains all the files needed on the Raspberry PI devices 
We are assuming that all raspberry PI devices used in the Prairie already have the Mosquitto MQTT client installed
To set up a new Raspberry PI device for use in our installation:
```
sudo apt install -y mosquitto mosquitto-clients
```

Then run it with:
```
mosquitto -d
```

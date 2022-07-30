const express = require("express");
const mqtt = require('mqtt')
const math = require("mathjs")
const app = express();



//const connectUrl = "mqtt://73.254.192.189:41799"
const connectUrl = "mqtt://test.mosquitto.org:1883"

console.log('Connecting to:', connectUrl)
const client = mqtt.connect(connectUrl, {
  clientId: "PrairieMqttTool",
  clean: true,
  connectTimeout: 4000,
  username: null,
  password: null,
  reconnectPeriod: 1000,
})

const topic = 'Portal'
client.on('connect', () => {
  console.log('Connected')
  client.subscribe([topic], () => {
    console.log(`Subscribed to topic '${topic}'`)
  })
})

var portalTopicFeed  = [];

client.on('message', (topic, payload) => {
  console.log('Received Message:', topic, payload.toString())
  portalTopicFeed.push(JSON.parse(payload.toString()))
})


app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.post("/mqtt/topic/portal", (req, res) => {
  console.log("POST /mqtt/topic/portal");
  fieldDict = { "sender":"portal1", "direction":"forward" }
  tagsDict = { "host":"PrairieMqttTool" }
  msgDict = { "name":"trigger", "fields":fieldDict, "tags":tagsDict, "timestamp":math.floor(Date.now()/1000) }
  json_object = JSON.stringify(msgDict)

  client.publish(topic, json_object, { qos: 0, retain: false }, (error) => {
    if (error) {
      console.error(error)
    }
  })  
  console.log("mqtt published:", json_object);

  res.redirect("/");
});

app.get("/mqtt/topic/portal", (req, res) => {
  console.log("GET /mqtt/topic/portal returning", JSON.stringify(portalTopicFeed));
  res.send(JSON.stringify(portalTopicFeed));
});




const PORT = process.env.PORT || 8080;
  
app.listen(PORT, console.log(`Server started on port ${PORT}`));


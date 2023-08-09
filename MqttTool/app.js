const express = require("express");
const mqtt = require('mqtt')
const math = require("mathjs")
const app = express();

// for parsing application/json
app.use(express.json()); 

// for parsing application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true })); 

//const connectUrl = "mqtt://73.254.192.189:41799"
const connectUrl = "mqtt://localhost:1883"
//const connectUrl = "mqtt://127.0.0.1:1883"

console.log('Connecting to:', connectUrl)
const client = mqtt.connect(connectUrl, {
  clientId: "PrairieMqttTool",
  clean: true,
  connectTimeout: 4000,
  username: null,
  password: null,
  reconnectPeriod: 1000,
})

client.on('connect', () => {
  console.log('Connected')
  client.subscribe(['portal'], () => {
    console.log(`Subscribed to topic 'portal'`)
  })
  client.subscribe(['booth'], () => {
    console.log(`Subscribed to topic 'booth'`)
  })
  client.subscribe(['booth_session'], () => {
    console.log(`Subscribed to topic 'booth_session'`)
  })
  client.subscribe(['praire_control'], () => {
    console.log(`Subscribed to topic 'praire_control'`)
  })
})

var portalTopicFeed  = [];
var boothTopicFeed  = [];
var boothSessionTopicFeed  = [];
var praireControlTopicFeed  = [];

client.on('message', (topic, payload) => {
  console.log('Received Message:', topic, payload.toString())
  switch (topic) {
    case "portal":
      portalTopicFeed.push(JSON.parse(payload.toString()))
      break;
    case "booth":
      boothTopicFeed.push(JSON.parse(payload.toString()))
      break;
    case "booth_session":
      boothSessionTopicFeed.push(JSON.parse(payload.toString()))
      break;      
    case "praire_control":
      praireControlTopicFeed.push(JSON.parse(payload.toString()))
      break;      
    }
})


app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.post("/mqtt/topic/portal", (req, res) => {
  console.log("POST /mqtt/topic/portal");
  fieldDict = { "sender":req.body.sender, "direction":req.body.direction }
  tagsDict = { "host":"PrairieMqttTool" }
  msgDict = { "name":"trigger", "fields":fieldDict, "tags":tagsDict, "timestamp":math.floor(Date.now()/1000) }
  json_object = JSON.stringify(msgDict)

  client.publish("portal", json_object, { qos: 0, retain: false }, (error) => {
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

app.post("/mqtt/topic/booth", (req, res) => {
  console.log("POST /mqtt/topic/booth");
  fieldDict = { "sender":req.body.sender, "state":req.body.state }
  tagsDict = { "host":"PrairieMqttTool" }
  msgDict = { "name":"occupy_change", "fields":fieldDict, "tags":tagsDict, "timestamp":math.floor(Date.now()/1000) }
  json_object = JSON.stringify(msgDict)

  client.publish("booth", json_object, { qos: 0, retain: false }, (error) => {
    if (error) {
      console.error(error)
    }
  })  
  console.log("mqtt published:", json_object);

  res.redirect("/");
});

app.get("/mqtt/topic/booth", (req, res) => {
  console.log("GET /mqtt/topic/booth returning", JSON.stringify(boothTopicFeed));
  res.send(JSON.stringify(boothTopicFeed));
});


app.post("/mqtt/topic/booth_session", (req, res) => {
  console.log("POST /mqtt/topic/booth_session");
  fieldDict = { "sender":req.body.sender, "state":req.body.state }
  tagsDict = { "host":"PrairieMqttTool" }
  msgDict = { "name":req.body.message, "fields":fieldDict, "tags":tagsDict, "timestamp":math.floor(Date.now()/1000) }
  json_object = JSON.stringify(msgDict)

  client.publish("booth_session", json_object, { qos: 0, retain: false }, (error) => {
    if (error) {
      console.error(error)
    }
  })  
  console.log("mqtt published:", json_object);

  res.redirect("/");
});

app.get("/mqtt/topic/booth_session", (req, res) => {
  console.log("GET /mqtt/topic/booth_session returning", JSON.stringify(boothSessionTopicFeed));
  res.send(JSON.stringify(boothSessionTopicFeed));
});

app.post("/mqtt/topic/praire_control", (req, res) => {
  console.log("POST /mqtt/topic/praire_control");
  fieldDict = {  }
  tagsDict = {  }
  msgDict = { "name":req.body.message, "fields":fieldDict, "tags":tagsDict, "timestamp":math.floor(Date.now()/1000) }
  json_object = JSON.stringify(msgDict)

  client.publish("praire_control", json_object, { qos: 0, retain: false }, (error) => {
    if (error) {
      console.error(error)
    }
  })  
  console.log("mqtt published:", json_object);

  res.redirect("/");
});

app.get("/mqtt/topic/praire_control", (req, res) => {
  console.log("GET /mqtt/topic/praire_control returning", JSON.stringify(praireControlTopicFeed));
  res.send(JSON.stringify(praireControlTopicFeed));
});

const PORT = process.env.PORT || 8080;
  
app.listen(PORT, console.log(`Server started on port ${PORT}`));


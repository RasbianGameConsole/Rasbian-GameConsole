#Pi client that connects the pi as a client to read and send messages through the server
#PID to be created and stored by the main console GUI program on startup
import os
import paho.mqtt.client as mqtt

clientName = "PiGConsole"
piIP = "10.0.0.99"

mqttClient = mqtt.Client(clientName)

def connectionStatus(client, userData, err):
    print("connected!")
    mqttClient.subscribe("PICONSOLE")

def messageDecoder(client, userData, msg):
    print(str(msg.topic))
    print(str(msg.payload))
    

mqttClient.on_connect = connectionStatus
mqttClient.on_message = messageDecoder


mqttClient.connect(piIP, 1883, 60)
mqttClient.loop_forever()


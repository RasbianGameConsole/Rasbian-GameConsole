#Pi client that connects the pi as a client to read and send messages through the server
#PID to be created and stored by the main console GUI program on startup
import os
import paho.mqtt.client as mqtt

clientName = "PiGConsole"
piIP = "the pi ip address"

mqttClient = mqtt.Client(clientName)

mqttClient.on_connect = connectionStatus
mqttClient.on_message = messageDecoder

def connectionStatus():
    print("connected!")

def messageDecoder(client, userData, msg):
    print(str(msg.payload))    


mqttClient.connect(piIP, 1883, 60)
mqttClient.loop_forever()



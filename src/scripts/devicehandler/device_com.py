#Pi client that connects the pi as a client to read and send messages through the server
#PID to be created and stored by the main console GUI program on startup
import os
import time
import paho.mqtt.client as mqtt
import keyboard
import datetime

clientName = "PiGConsole"
piIP = "raspberrypi.local"

#/home/pi/Documents/client

log_file = open('logfile.txt','a')

def connect_callback(client, userdata, flags, rc):
    print("connected!")
    client.subscribe("PICONSOLE")
    log_file.write("connected" + "    " + datetime.datetime.now)
    
def on_message_callback(client, userdata, msg):
    print("Received")
    print(str(msg.topic))
    print(str(msg.payload))
    log_file.write(str(msg.payload) + "   " + datetime.datetime.now)

def continuous_pub(x=5):
        mqttClient.publish('PICONSOLE',"From Console",0,False)

        
mqttClient = mqtt.Client(clientName) 
mqttClient.on_connect = connect_callback
mqttClient.on_message = on_message_callback
mqttClient.connect(piIP, 1883, 60)
mqttClient.loop_forever()
continuous_pub(10)  




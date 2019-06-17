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

key_map = {
#TODO: build this map from input file
        'up' : 'up',
        'dn' : 'down',
        'lt' : 'left',
        'rt' : 'right',
        'a' : 's',
        'b' : 'a',
        'x' : 'd',
        'y' : 'w'
}

def key_event(command):
        if command[0] == 'kd':
                keyboard.press(key_map[command[1]])
        else:
                keyboard.release(key_map(command[1]))

def connect_callback(client, userdata, flags, rc):
    print("connected!")
    client.subscribe("PICONSOLE")
    
def on_message_callback(client, userdata, msg):
        command = str(msg.payload).split(' ')
        key_event(command)
        
    
        
mqttClient = mqtt.Client(clientName) 
mqttClient.on_connect = connect_callback
mqttClient.on_message = on_message_callback
mqttClient.connect(piIP, 1883, 60)
mqttClient.loop_forever()




To connect controllers to the pi, The MQTT connection standard has shown to be the best choice.
The iOS project features a Connection class and button class(inherits UI button) that attempts to make it simple to create
UI's with Buttons and not have to worry about sending and receiveing messages. All You need to do is get the singleton instance of the ConsoleConnection class and the rest is handled. This class also features a small API for some potentially useful functions if you need to do more advanced stuff. Much more will be comming with this as well as a similar Android Implementation.

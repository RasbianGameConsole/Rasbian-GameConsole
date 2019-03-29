//
//  ConsoleConnection.swift
//  RaspGameController
//
//  Created by Edward Hubbard on 12/27/18.
//  Copyright © 2018 Edward Hubbard. All rights reserved.
//

import Foundation
import CocoaMQTT

class ConsoleConnection : CocoaMQTTDelegate {

    
    //SINGLETON LOGIC==========================================
    
    private static var connection : ConsoleConnection? = nil

    public static func shared() -> ConsoleConnection{
        if(ConsoleConnection.connection == nil){
            ConsoleConnection.connection = ConsoleConnection()
        }
        return ConsoleConnection.connection!
    }
    
    //MEMBER VARS==============================================
    
    private var MQTTClient : CocoaMQTT? = nil
    private var connected : Bool = false
    private var connectionTopic : String = "CONNECT"
    private var currentData : String? = nil
    private var players : [Int]? = nil
    
    //INIT's===================================================
    
    private init(){
        let phoneID =  UIDevice.current.identifierForVendor?.uuidString
        self.MQTTClient = CocoaMQTT(clientID: phoneID!, host: "169.254.61.217", port: 1883)
        self.MQTTClient?.delegate = self
        do {
            print("trying to connect")
            try self.connect()
        } catch let err as NSError? {
            print(err?.domain as Any) // TODO: REPLACE PRINT STATEMENTS WITH USER USEFUL ERROR HANDLING
            print("FAILED TO CONNECT")
        }
    }
    
    private func connect() throws ->  NSError?{
        if(MQTTClient?.connect() == false){
            throw NSError(domain: "Cannot Connect to Device", code: 1, userInfo: nil)
        }
        let connectMsg = CocoaMQTTMessage(topic: "PICONSOLE", string: (UIDevice.current.identifierForVendor?.uuidString)!)
        self.MQTTClient?.publish(connectMsg)
        self.connected = true
        
        return nil
    }
    
    private func availablePlayerSlots(slots: String){
        
        let strArr = slots.split(separator: "-")
        var iArr = Array<Int>()
        for i in strArr{
            iArr.append(Int(i)!)
        }
        self.players = iArr;
    }
    
    private func getData(data: String){
        self.currentData = data
    }
    
    //API ACCESSIBLE FUNCTIONS=====================================
    
    public func disconnect(){
        self.MQTTClient?.disconnect()
    }
    
    public func publishData(topic: String, data: String){
        self.MQTTClient?.publish(CocoaMQTTMessage(topic: topic, string: data))
    }
    
    
    public func getClient() -> CocoaMQTT?{     //USE AT YOUR OWN RISK
        return self.MQTTClient
    }
    
    public func getAvailPlayers() -> [Int]{
        return self.players!
    }
    
    // DELEGATE PROTOCOL METHODS=====================================
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        self.MQTTClient?.subscribe(self.connectionTopic)
        print("connected")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("published")
        print(message.string!)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        if(message.topic == "CONNECT"){
            availablePlayerSlots(slots: message.string!)
        }else{
            self.getData(data: message.string!)
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        print("subscribed to \(topic)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("unsubscribed from \(topic)")
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        
    }
}

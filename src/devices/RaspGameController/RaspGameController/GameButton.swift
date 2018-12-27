//
//  GameButton.swift
//  RaspGameController
//
//  Created by Edward Hubbard on 12/26/18.
//  Copyright © 2018 Edward Hubbard. All rights reserved.
//

import Foundation
import UIKit
import CocoaMQTT

class GameButton: UIButton {
    
    var playerNumber : Int = 0
    var mqtt = ConsoleConnection.shared()
    var buttonFunction : String!
    static var keyDictionary : Dictionary<String,(String,String)> = ["up" : ("kd up","ku up"),
                                                                     "down": ("kd dn","ku dn"),
                                                                     "left": ("kd lt","ku lt"),
                                                                     "right": ("kd rt","ku rt"),]
    init(frame: CGRect,functionality: String!, playerNum: Int){
        super.init(frame: frame)
        self.buttonFunction = self.setFunctionality(functionality: functionality);
        self.playerNumber = playerNum
    }
    
    override init(frame: CGRect){
        super.init(frame: frame);
        self.buttonFunction = self.setFunctionality(functionality: "WILL RETURN AND SET TO 'UP' BY DEFAULT")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setFunctionality(functionality: String!) -> String{
        if(GameButton.keyDictionary.keys.contains(functionality)){
            return functionality;
        }
        return "up"
    }
    
    private func setEventHandlers(){
        //TODO: INTERNET SAYS THIS METHOD OF PRESS AND HOLD EVENTS HAS BUGS FIGURE OUT A BETTER WAY
        self.addTarget(self, action: #selector(whenHolding), for: .touchDown)
        self.addTarget(self, action: #selector(whenReleased), for: .touchUpInside)
    }
    
    @objc private func whenHolding(){
        let sendStr : (String,String)! = GameButton.keyDictionary[self.buttonFunction]
        mqtt.publishData(topic: String(self.playerNumber), data: sendStr.0)
    }
    
    @objc private func whenReleased(){
        let sendStr : (String,String)! = GameButton.keyDictionary[self.buttonFunction]
        mqtt.publishData(topic: String(self.playerNumber), data: sendStr.1)
    }
}

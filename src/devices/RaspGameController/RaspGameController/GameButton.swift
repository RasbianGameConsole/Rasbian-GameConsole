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
    var callback : ()->Void
    static var keyDictionary : Dictionary<String,(String,String)> = ["up" : ("kd up","ku up"),
                                                                     "down": ("kd dn","ku dn"),
                                                                     "left": ("kd lt","ku lt"),
                                                                     "right": ("kd rt","ku rt"),]
    init(frame: CGRect,functionality: String!, playerNum: Int){
        self.callback = {()->Void in
        }
        super.init(frame: frame)
        self.buttonFunction = self.setFunctionality(functionality: functionality);
        self.playerNumber = playerNum
    }
    
    override init(frame: CGRect){
        self.callback = {()->Void in
        }
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
    
    public func onPress(function: @escaping ()->Void){
        self.callback = function
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let sendStr : (String,String)! = GameButton.keyDictionary[self.buttonFunction]
        mqtt.publishData(topic: "PICONSOLE", data: sendStr.0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let sendStr : (String,String)! = GameButton.keyDictionary[self.buttonFunction]
        mqtt.publishData(topic: "PICONSOLE", data: sendStr.1)
        self.callback()
    }
}

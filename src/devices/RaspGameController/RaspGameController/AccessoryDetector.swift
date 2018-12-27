//
//  AccessoryDetector.swift
//  RaspGameController
//
//  Created by Edward Hubbard on 12/24/18.
//  Copyright © 2018 Edward Hubbard. All rights reserved.
//

import Foundation
import ExternalAccessory

class AccessoryDetector: NSObject {
    
    var manager : EAAccessoryManager // gets all connected devices via bluetooth or lightning
    var device : EAAccessory? // will store the target device (our rPi)
    
   override init() {
        self.device = nil
        self.manager = EAAccessoryManager.shared() //singleton getInstance method
        super.init()
    
    }
    //method for testing to see if we can find rPi through lightning
    public func getDevices() -> [EAAccessory]?{
        if (self.manager.connectedAccessories.count < 1){
            return nil
        }
        return self.manager.connectedAccessories
    }
    
    private func setPi(rPi: EAAccessory?){
        self.device = rPi
    }
    
}

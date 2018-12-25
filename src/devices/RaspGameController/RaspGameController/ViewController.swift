//
//  ViewController.swift
//  RaspGameController
//
//  Created by Edward Hubbard on 12/24/18.
//  Copyright © 2018 Edward Hubbard. All rights reserved.
//

import UIKit
import ExternalAccessory

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        let accessory = EAAccessoryManager.shared()
        textView(acc: accessory.connectedAccessories)
        /*let EA = EASession(accessory: .init(), forProtocol: "")
        var str = "hello"
        let array: [UInt8] = Array(str.utf8)
        EA!.outputStream?.write(array, maxLength: 5)*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textView(acc: [EAAccessory]){
        let text = UILabel()
        text.text = acc[0].name
        self.view.addSubview(text)
        
    }


}


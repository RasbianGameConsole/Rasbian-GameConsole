//
//  ViewController.swift
//  RaspGameController
//
//  Created by Edward Hubbard on 12/24/18.
//  Copyright © 2018 Edward Hubbard. All rights reserved.
//

import UIKit
import CocoaMQTT
import Foundation

class ViewController: UIViewController {


    var label : UILabel? = nil
    static var incr : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let phoneID = UIDevice.current.identifierForVendor?.uuidString
        self.label = textView(txt: "finding...")
        let btn : UIButton = findBtn()
        self.view.backgroundColor = UIColor.green
    }
    
    func textView(txt: String) -> UILabel{
        let rect = CGRect(x: 100, y: 100, width: 100, height: 200)
        let text = UILabel(frame: rect)
        text.text = txt
        self.view.addSubview(text)
        return text
    }
    
    func findBtn() -> UIButton{
        let  rect = CGRect(x: 100, y: 250, width: 100, height: 200)
        let btn = GameButton(frame: rect, functionality: "up", playerNum: 1)
        btn.backgroundColor = .red
        btn.setTitle("find/unfind pi", for: .normal)
        btn.onPress(function: self.myCustomCallback)
        self.view.addSubview(btn)
        return btn
    }
    
   public func myCustomCallback()->Void {
        ViewController.incr += 1
        self.label?.text = "button pressed\(ViewController.incr) times"
    }
 
    
    


}


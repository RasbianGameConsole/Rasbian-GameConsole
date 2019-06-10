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

    var upBtn : GameButton?
    var downBtn : GameButton?
    var leftBtn : GameButton?
    var rightBtn : GameButton?
    var aBtn : GameButton?
    var bBtn : GameButton?
    var xBtn : GameButton?
    var yBtn : GameButton?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let height = self.view.frame.height
        let width = self.view.frame.width
        self.view.backgroundColor = UIColor.black
        self.upBtn =
            genBtn(x: Int(width / 6), y: 0, color: UIColor.gray, function: "up")
        self.downBtn =
            genBtn(x: Int(width / 6), y: 2 * Int(height / 3), color: UIColor.gray, function: "down")
        self.leftBtn =
            genBtn(x: 0, y:  Int(height / 3), color: UIColor.gray,function: "left")
        self.rightBtn =
            genBtn(x: Int(width / 3), y: Int(height / 3), color: UIColor.gray,function: "right")
        self.aBtn =
            genBtn(x: Int(2 * width / 3), y: 2 * Int(height / 3), color: UIColor.red, function: "a")
        self.bBtn =
            genBtn(x: Int(width / 2), y: Int(height / 3), color: UIColor.blue, function: "b")
        self.xBtn =
            genBtn(x: Int(5 * width / 6), y: Int(height / 3), color: UIColor.yellow, function: "x")
        self.yBtn =
            genBtn(x: Int(2 * width / 3), y: 0, color: UIColor.green, function: "y")
    }
    
    
    func genBtn(x: Int, y: Int, color: UIColor,function: String) -> GameButton{
        let height = self.view.frame.height
        let width = self.view.frame.width
        let  rect = CGRect(x: x, y: y, width: Int(width/6), height: Int(height/3))
        let btn = GameButton(frame: rect, functionality: function, playerNum: 1)
        btn.backgroundColor = color
        
        btn.setTitle(String.uppercased(function)(), for: .normal)
        self.view.addSubview(btn)
        return btn
    }
    

 
    
    


}


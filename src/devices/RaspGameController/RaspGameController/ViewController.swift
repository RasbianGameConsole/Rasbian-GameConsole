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

    var upBtn : GameButton
    var downBtn : GameButton
    var leftBtn : GameButton
    var rightBtn : GameButton
    var aBtn : GameButton
    var bBtn : GameButton
    var xBtn : GameButton
    var yBtn : GameButton
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        <#code#>
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.upBtn = genBtn(x: 100, y: 250, color: UIColor.gray, function: "up")
        self.downBtn = genBtn(x: 0, y: 200, color: UIColor.gray, function: "down")
        self.leftBtn = genBtn(x: 0, y: 200, color: UIColor.gray,function: "left")
        self.rightBtn = genBtn(x: 0, y: 200, color: UIColor.gray,function: "right")
        self.aBtn = genBtn(x: 0, y: 200, color: UIColor.red, function: "a")
        self.bBtn = genBtn(x: 0, y: 200, color: UIColor.blue, function: "b")
        self.xBtn = genBtn(x: 0, y: 200, color: UIColor.yellow, function: "x")
        self.yBtn = genBtn(x: 0, y: 200, color: UIColor.green, function: "y")
    }
    
    
    func genBtn(x: Int, y: Int, color: UIColor,function: String) -> GameButton{
        let  rect = CGRect(x: x, y: y, width: 100, height: 200)
        let btn = GameButton(frame: rect, functionality: function, playerNum: 1)
        btn.backgroundColor = .red
        btn.setTitle("find/unfind pi", for: .normal)
        self.view.addSubview(btn)
        return btn
    }
    

 
    
    


}


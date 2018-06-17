//
//  ViewController.swift
//  131_HowToUsePods
//
//  Created by Atsushi on 2018/06/09.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        myLabel.font = UIFont.fontAwesome(ofSize: 100)
        myLabel.text = String.fontAwesomeIcon(name: .facebook)
        myLabel.backgroundColor = UIColor.blue
        myLabel.textColor = UIColor.white
//        myLabel.frame = CGRect(x: screenWidth/2 , y: screenHeight/2, width: 120, height: 120)
        myLabel.frame.size = CGSize(width: 120, height: 120)
        myLabel.center = CGPoint(x: screenWidth/2 , y: screenHeight/2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


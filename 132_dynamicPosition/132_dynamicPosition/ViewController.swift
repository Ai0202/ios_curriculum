//
//  ViewController.swift
//  132_dynamicPosition
//
//  Created by Atsushi on 2018/06/09.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tap(_ sender: UIButton) {
        
        UIView.animate(withDuration: 5.0, animations: { () -> Void in
            self.myLabel.backgroundColor = UIColor.blue
            self.myLabel.center.y -= 100
        }, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  128_UserDefault
//
//  Created by Atsushi on 2018/06/09.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let keyName = "imageSwitchFlg"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var articleTextView: UITextView!
    
    @IBOutlet weak var newsImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let myDefault = UserDefaults.standard
        
        var imageSwitchFlg = true
        
        if myDefault.object(forKey: keyName) != nil {
            imageSwitchFlg = myDefault.object(forKey: keyName) as! Bool
        }
        
        if imageSwitchFlg {
            newsImage.isHidden = false
        }
        else {
            newsImage.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    


}


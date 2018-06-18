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
    
    override func viewWillAppear(_ animated: Bool) {
        
        let imageSwitchFlg = UserDefaults.standard.bool(forKey: keyName)
        
        newsImage.isHidden = !imageSwitchFlg
        
    }

}


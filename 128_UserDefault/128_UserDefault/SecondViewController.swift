//
//  SecondViewController.swift
//  128_UserDefault
//
//  Created by Atsushi on 2018/06/09.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let keyName = "imageSwitchFlg"
    
    @IBOutlet weak var imageSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageSwitchFlg = UserDefaults.standard.bool(forKey: keyName)
        
        imageSwitch.isOn = imageSwitchFlg
    }
    
    
    @IBAction func changeImageSwitch(_ sender: UISwitch) {
        
        //データの書き込み
        UserDefaults.standard.set(sender.isOn, forKey: keyName)
        
        //データを反映させる
        UserDefaults.standard.synchronize()
    }
    

}

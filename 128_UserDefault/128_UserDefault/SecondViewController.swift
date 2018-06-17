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
    
    let myDefault = UserDefaults.standard
    
    @IBOutlet weak var imageSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageSwitchFlg = true
        
        if myDefault.object(forKey: keyName) != nil {
            imageSwitchFlg = myDefault.object(forKey: keyName) as! Bool
        }
        
        imageSwitch.isOn = imageSwitchFlg
    }
    
    
    @IBAction func changeImageSwitch(_ sender: UISwitch) {
        
        //データの書き込み
        myDefault.set(sender.isOn, forKey: keyName)
        
        //データを反映させる
        myDefault.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

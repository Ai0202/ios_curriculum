//
//  ViewController.swift
//  omikuji
//
//  Created by Atsushi on 2018/05/25.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

//http://hackers.nexseed.net/curriculums/94

import UIKit

class ViewController: UIViewController {
    
    var res:Int = 0
    var hoge = ["大吉", "吉", "中吉", "凶", "大凶"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tap(_ sender: Any) {
        res = Int(arc4random_uniform(5))
        
        let alert = UIAlertController(title: "今日の運勢", message: hoge[res], preferredStyle: .alert)
        
        alert.view.layer.cornerRadius = 30
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        print(res)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


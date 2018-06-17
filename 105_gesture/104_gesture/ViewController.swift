//
//  ViewController.swift
//  104_gesture
//
//  Created by Atsushi on 2018/05/26.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func swipe(_ sender: Any) {
        let alert = UIAlertController(title: "問題です", message: "あなたが落としたのは?", preferredStyle: .alert)
        
        alert.view.layer.cornerRadius = 40
        
        alert.addAction(UIAlertAction(title: "金の斧", style: .default, handler: {action in print("正解")}))
        alert.addAction(UIAlertAction(title: "銀の斧", style: .destructive, handler: {action in print("違う")}))
        alert.addAction(UIAlertAction(title: "落としてないよ", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tap(_ sender: Any) {
        let action = UIAlertController(title: "問題です", message: "あなたがやったのは??", preferredStyle: .actionSheet)
        
        action.addAction(UIAlertAction(title: "tap", style: .default, handler: nil))
        action.addAction(UIAlertAction(title: "何もしてない", style: .cancel, handler: nil))
        
        present(action, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


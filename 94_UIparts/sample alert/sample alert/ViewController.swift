//
//  ViewController.swift
//  sample alert
//
//  Created by Atsushi on 2018/05/24.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tap(_ sender: Any) {
        weather()
    }
    
    func weather() {
        let alert = UIAlertController(title: "問題です", message: "今日の天気は?", preferredStyle: .alert)
//        let alert = UIAlertController(title: "問題です", message: "今日の天気は?", preferredStyle: .actionSheet)
        
        
        alert.view.layer.cornerRadius = 30
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.backgroundColor = UIColor.darkGray
        
        alert.addAction(UIAlertAction(title: "はれ", style: .default, handler: {action in print("正解")}))
        alert.addAction(UIAlertAction(title: "あめ", style: .cancel, handler: {action in print("違う")}))
        alert.addAction(UIAlertAction(title: "くもり", style: .destructive, handler: {action in self.hoge()}))
        
        
        present(alert, animated: true, completion: {() -> Void in print("表示されたよ")})
    }
    
    func hoge(){
         print("ほーげほげ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


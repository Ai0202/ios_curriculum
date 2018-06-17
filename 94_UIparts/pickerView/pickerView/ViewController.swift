//
//  ViewController.swift
//  pickerView
//
//  Created by Atsushi on 2018/05/23.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myPickerView: UIPickerView!
    var arr = ["hoge", "fuga", "ika", "tako"]
    
    var arr2 = ["atatata", "ddffdfdf", "ika", "tako", "dfdfdf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
   
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (component == 0) {
            return arr.count
        } else {
            return arr2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (component == 0) {
            return arr[row]
        } else {
            return arr2[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        weather()
        
        print(arr[row])
        let alert = UIAlertController(title: "今日の天気は?", message: arr[row], preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: arr2[row], style: .default, handler: {action in print("正解")}))
        alert.addAction(UIAlertAction(title: "あめ", style: .cancel, handler: {action in print("違う")}))
        alert.addAction(UIAlertAction(title: "くもり", style: .destructive, handler: {action in self.hoge()}))
        
        present(alert, animated: true, completion: {() -> Void in print("表示されたよ")})
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


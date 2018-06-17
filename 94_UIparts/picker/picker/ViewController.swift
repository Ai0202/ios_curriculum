//
//  ViewController.swift
//  picker
//
//  Created by Atsushi on 2018/05/23.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        df.locale = Locale(identifier: "ja_JP")
        
        
//        myDatePicker.minimumDate = df.date(from: "2016/1/1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dateSelected(_ sender: UIDatePicker) {
        super.viewDidLoad()
        
        let df = DateFormatter()
        
        df.dateFormat = "yyyy/MM/dd"
        df.locale = Locale(identifier: "ja_JP")
        
        print(df.string(from: sender.date))
        
        dateLabel.text = df.string(from: sender.date)
        
        df.dateStyle = .medium
        df.timeStyle = .none
        df.doesRelativeDateFormatting = true
        
        dateLabel2.text = df.string(from: sender.date)
    }
    
}


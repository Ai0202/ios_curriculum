//
//  ViewController.swift
//  144_MiniGuideMap
//
//  Created by Atsushi on 2018/06/14.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var selectedName = String()
    
    var guideList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ファイルのパスを取得
        let filePath = Bundle.main.path(forResource: "guideList", ofType: "plist")

        //ファイルの内容を読み込んでディクショナリー型に代入
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい形(エリア名の入ってる配列)を作成
        guideList = (dic?.allKeys) as! [String]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.textColor = UIColor.purple
        
        //矢印を右側につける
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel!.text = guideList[indexPath.row]
        
        return cell
    }
    
    //選択された時に行う処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = guideList[indexPath.row]
        performSegue(withIdentifier: "showSecondView", sender: nil)
    }
    
    //Segueで画面遷移する時
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        
        secondVC.scSelectedName = selectedName
    }

}


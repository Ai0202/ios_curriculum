//
//  ViewController.swift
//  129_coredata
//
//  Created by Atsushi on 2018/06/11.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    var sweetMemoryList:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
//        createSweetMemory(place: "千葉")
        
        readSweetMemory()
        
    }
    
    func createSweetMemory(place:String) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        //エンティティ
        let sweetMemory = NSEntityDescription.entity(forEntityName: "SweetMemory", in: manageContext)
        
        let newRecord = NSManagedObject(entity: sweetMemory!, insertInto: manageContext)
        
        //レコードに値を設定
        newRecord.setValue(place, forKey: "place")
        newRecord.setValue(Date(), forKey: "date")
        
        do {
            try manageContext.save()
        } catch {
            print("error", error)
        }
    }
    
    func readSweetMemory() {
        //AppDelegateのインスタンス化
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        //取り出し
        let fetchRequest:NSFetchRequest<SweetMemory> = SweetMemory.fetchRequest()
        
        //並び替え
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        
        //データ取得 配列で取得される
        do {
            let fetchResults = try manageContext.fetch(fetchRequest)
            
            for result in fetchResults {
                //1件ずつ取り出し
                let place:String? = result.value(forKey: "place") as? String
                let date:Date? = result.value(forKey: "date") as? Date

                
                let dic = ["place":place, "date":date] as [String: Any]
                
                sweetMemoryList.append(dic as NSDictionary)
            }
        } catch {
            print("read error:",error)
        }
        
    }
    
    func deleteSweetMemory(place:String) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<SweetMemory> = SweetMemory.fetchRequest()
        
        let predicate = NSPredicate(format: "place = %@", place)
        fetchRequest.predicate = predicate
        
        do {
            // データ取得 配列で取得される
            let fetchResults = try manageContext.fetch(fetchRequest)
            
            for result in fetchResults {
                // １件ずつ取り出し
                let place:String? = result.value(forKey: "place") as? String
                let date:Date? = result.value(forKey: "date") as? Date
                
                print("place:\(place)","date:\(date)")
                
                manageContext.delete(result)  // 絞り込んだレコードを削除
            }
            try manageContext.save()  // 削除した状態を保存
            
        } catch  {
            print("read error:",error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sweetMemoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let dic = sweetMemoryList[indexPath.row]
        cell.textLabel?.text = dic["place"] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let dic = sweetMemoryList[indexPath.row]
            let place = dic["place"] as! String
            
            //CoreDataから削除
            deleteSweetMemory(place: place)
            
            //表示用の配列の削除
            sweetMemoryList.remove(at: indexPath.row)
            
            //行が消える
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}


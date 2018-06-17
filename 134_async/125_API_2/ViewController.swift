//
//  ViewController.swift
//  125_API_2
//
//  Created by Atsushi on 2018/06/12.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //非推奨
    let queue:DispatchQueue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
    
    var musicList:[NSDictionary] = []
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isHidden = true
        indicator.startAnimating()
        
        queue.async{() -> Void in
            
            //itunesのAPIからmaroon5の情報を20件取得
            let url = URL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch?term=marron5&limit=20")
            let request = URLRequest(url: url!)
            //sendSynchronousRequestが非推奨だからあとで変更
            let jsonData = (try! NSURLConnection.sendSynchronousRequest(request, returning: nil))
            let jsonDic = (try! JSONSerialization.jsonObject(with: jsonData, options: [])) as! NSDictionary
            
            for(key, data) in jsonDic{
                if(key as! String == "results"){
                    let results = data as! NSArray
                    for (eachMusic) in results{
                        let musicDic:NSDictionary = eachMusic as! NSDictionary
                        
                        let newMusic:NSDictionary = ["name":musicDic["trackName"] as! String,
                                                     "image":musicDic["artworkUrl100"] as! String]
                        
                        self.musicList.append(newMusic)
                    }
                }
            }
            self.collectionView.reloadData()
            self.collectionView.isHidden = false
            self.indicator.stopAnimating()
        }
        

    }
    
    //セクションの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //セクションの中のセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    //セルの中身
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        let url = URL(string: musicList[indexPath.row]["image"] as! String)
        let imageData:Data = (try! Data(contentsOf: url!, options: NSData.ReadingOptions.mappedIfSafe))
        let img = UIImage(data: imageData)
        
        cell.title.text = musicList[indexPath.row]["name"] as! String
        cell.image.image = img
        cell.backgroundColor = UIColor.black
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


//
//  SecondViewController.swift
//  144_MiniGuideMap
//
//  Created by Atsushi on 2018/06/14.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myMap: MKMapView!
    
    var scSelectedName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedPlace = getSelectedPlace()
        
        setPlaceOnMap(selectedPlace: selectedPlace)
    }
    
    @IBAction func showActivityView(_ sender: Any) {
        let controller = UIActivityViewController(activityItems: [myImageView.image!],
                                                  applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    func getSelectedPlace() -> NSDictionary {
        //ファイルパス取得
        let filePath = Bundle.main.path(forResource: "guideList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        let selectedPlace = (dic?.object(forKey: scSelectedName)) as! NSDictionary
        
        return selectedPlace
    }
    
    func setPlaceOnMap(selectedPlace:NSDictionary) {
        navigationItem.title = scSelectedName
        myTextView.text = selectedPlace["description"] as! String
        myImageView.image = UIImage(named: selectedPlace["image"] as! String)
        let latitude = selectedPlace["latitude"] as! String
        let longitude = selectedPlace["longitude"] as! String
        
        let coordinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(coordinate, span)
        myMap.setRegion(region, animated: true)
        
        //ピンを生成
        let myPin = MKPointAnnotation()
        
        //座標を設定
        myPin.coordinate = coordinate
        
        //タイトルを設定
        myPin.title = scSelectedName
        
        //サブタイトルを設定
        myPin.subtitle = "おすすめ"
        
        //MapViewにピンを追加
        myMap.addAnnotation(myPin)
    }
}

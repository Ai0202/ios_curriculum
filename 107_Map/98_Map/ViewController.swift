//
//  ViewController.swift
//  98_Map
//
//  Created by Atsushi on 2018/06/07.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation //現在地取得用

class ViewController: UIViewController, MKMapViewDelegate,
    CLLocationManagerDelegate{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    
    //現在地取得用
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: "sample", ofType: "plist")
        
        let dics = NSDictionary(contentsOfFile: filePath!)
        
        for(key, data) in dics! {
            let title = key as! String
            let dic = data as! NSDictionary
            
            //ピンの設定
            let pin = MKPointAnnotation()
            let latitude = dic["latitude"] as! String
            let longitude = dic["longitude"] as! String
            
            pin.coordinate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))

            
            //ピンのタイトル、サブタイトルの設定
            pin.title = title
            pin.subtitle = dic["description"] as! String
            
            //地図に刺す
            mapView.addAnnotation(pin)
            
            mapView.delegate = self
            
            //位置情報使用開始
            locationManager.startUpdatingLocation()
            
            //位置情報使用許可のリクエスト表示
            locationManager.requestWhenInUseAuthorization()
            
            locationManager.delegate = self
        }
        
        //地図の設定 中心と表示範囲を指定
        let span = MKCoordinateSpanMake(1, 1)
        let centerPin = MKPointAnnotation()
        centerPin.coordinate = CLLocationCoordinate2DMake(35.2749915, 136.9391058)
        
        let region = MKCoordinateRegionMake(centerPin.coordinate, span)
        
        mapView.setRegion(region, animated: true)
    }
    
    //ピンがタップされた時に発動
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        titleLabel.text = view.annotation?.title!
        detailTextView.text = view.annotation?.subtitle!
    }
    
    //ピンの見た目を変更する
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is MKPointAnnotation){
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView =  mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true //吹き出しのありなし
        }
        else {
            annotationView!.annotation = annotation
        }
        
        let pinImage = UIImage(named: "pinimage.jpg")
        annotationView?.image = pinImage
        annotationView?.frame.size = CGSize(width: 30, height: 30)
        
        return annotationView
    }
    
    //位置情報がアップデートされた時に発動
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function, "first:", locations.first!)
        print(#function, "last:",locations.last!)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


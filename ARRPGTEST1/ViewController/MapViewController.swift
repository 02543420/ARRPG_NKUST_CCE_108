//
//  ViewController.swift
//  mymap4
//
//  Created by 曾禎郁 on 2019/3/12.
//  Copyright © 2019 曾禎郁. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func Reset(_ sender: UIButton) {
        zoomInMap()
    }
    
    var locationManager = CLLocationManager()
    var missionData : MissionData?
    let point = MKPointAnnotation()
    var point2 = MKPointAnnotation()
    let point3 = MKPointAnnotation()
    let point4 = MKPointAnnotation()
    var targetLocation = CLLocation(latitude: 22.758426, longitude: 120.338378)
    var targetLocation1 = CLLocation(latitude: 22.756960, longitude: 100.338606)
    var targetLocation2 = CLLocation(latitude: 22.756930, longitude: 120.338606)
    var targetLocation3 = CLLocation(latitude: 22.756930, longitude: 130.338606)
    
    var location = [CLLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //mapView.showsUserLocation = true
      //  mapView.userTrackingMode = .follow
        mapView.delegate = self
        if CLLocationManager.locationServicesEnabled() == true {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                
            locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
            
            
            
        }else{
            print("請打開定位")
        }
        
        //隱藏NavigationBar
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.shadowImage = image
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = [locations[0] as CLLocation]
        
        //let c = locations[0] as CLLocation;
       // let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        if(missionData?.missionIntegrate[1].isAcception == true && missionData?.missionIntegrate[1].isComplete == false ){
            let c = targetLocation
            addPointAnnotation(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude)
            //從以下開始有問題，目前就只能出現第一個大頭針而已
        }else if(missionData?.missionIntegrate[1].isComplete == true && missionData?.missionIntegrate[2].isComplete == false){
            let c = targetLocation1
            addPointAnnotation2(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude)
        }
        if (missionData?.missionIntegrate[2].isComplete == true && missionData?.missionIntegrate[3].isComplete == false){
            let c = targetLocation2
            addPointAnnotation(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude)
        
        }
        if (missionData?.missionIntegrate[3].isComplete == true && missionData?.missionIntegrate[4].isComplete == false){
            let c = targetLocation3
            addPointAnnotation(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude)
        }
        /*
         else if(missionData?.missionIntegrate[1].isComplete == true){
            self.mapView.removeAnnotation(point);
            //removeAnnotation(gesture: <#T##UIGestureRecognizer#>)
        }
         */
        
        if(missionData?.missionIntegrate[2].isAcception == true && missionData?.missionIntegrate[1].isComplete == true && missionData?.missionIntegrate[3].isComplete == false){
            let c = targetLocation
            addPointAnnotation(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude)
            
        }
        if(missionData?.missionIntegrate[4].isAcception == true && missionData?.missionIntegrate[3].isComplete == true && missionData?.missionIntegrate[4].isComplete == false){
            let c = targetLocation
            addPointAnnotation(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude)
            
        }
        if(missionData?.missionIntegrate[4].isComplete == true){
            mapView.removeAnnotation(point)
        }
        /*
        if(missionData?.missionIntegrate[1].isComplete == true && missionData?.missionIntegrate[2].isComplete == false ){
                self.mapView.removeAnnotation(point)
            
        }else if(missionData?.missionIntegrate[2].isComplete == true && missionData?.missionIntegrate[3].isComplete == false ){
                self.mapView.removeAnnotation(point)
            
        }else if (missionData?.missionIntegrate[3].isComplete == true && missionData?.missionIntegrate[4].isComplete == false  ){
                self.mapView.removeAnnotation(point)
            
        }else if(missionData?.missionIntegrate[4].isComplete == true ){
                self.mapView.removeAnnotation(point)
            
        }
        */
        
        
       // self.mapView.setRegion(region, animated: true)
    }
    
    func zoomInMap(){
        //var locations = [CLLocation]()
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location[0].coordinate.latitude, longitude: location[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region, animated: true)
    }
    
    private func addPointAnnotation(latitude:CLLocationDegrees , longitude:CLLocationDegrees){
        //大頭針
        //let point:MKPointAnnotation = MKPointAnnotation();
        //設定大頭針的座標位置
        point.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude);
        //for i in 1...4{
            if(missionData?.missionIntegrate[1].isComplete == false ){
                point.title = missionData?.missionIntegrate[1].taskName
                point.subtitle = "緯度：\(latitude) 經度:\(longitude)"
            }
            if(missionData?.missionIntegrate[2].isComplete == false && missionData?.missionIntegrate[1].isComplete == true){
                point.title = missionData?.missionIntegrate[2].taskName
                point.subtitle = "緯度：\(latitude) 經度:\(longitude)"
            }
            if(missionData?.missionIntegrate[3].isComplete == false && missionData?.missionIntegrate[2].isComplete == true){
                point.title = missionData?.missionIntegrate[3].taskName
                point.subtitle = "緯度：\(latitude) 經度:\(longitude)"
            }
            if(missionData?.missionIntegrate[4].isComplete == false && missionData?.missionIntegrate[3].isComplete == true){
                point.title = missionData?.missionIntegrate[4].taskName
                point.subtitle = "緯度：\(latitude) 經度:\(longitude)"
            }
      //  }
            

        
        mapView.addAnnotation(point);
  
    }
 
    
    private func addPointAnnotation2(latitude:CLLocationDegrees , longitude:CLLocationDegrees){
        //大頭針
        //let point:MKPointAnnotation = MKPointAnnotation();
        //設定大頭針的座標位置
        point2.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude);
            point2.title = missionData?.missionIntegrate[2].taskName
            point2.subtitle = "緯度：\(latitude) 經度:\(longitude)"
        
        if(missionData?.missionIntegrate[3].isComplete == false && missionData?.missionIntegrate[2].isComplete == true){
            point.title = missionData?.missionIntegrate[3].taskName
            point.subtitle = "緯度：\(latitude) 經度:\(longitude)"
        }
        if(missionData?.missionIntegrate[4].isComplete == false && missionData?.missionIntegrate[3].isComplete == true){
            point.title = missionData?.missionIntegrate[4].taskName
            point.subtitle = "緯度：\(latitude) 經度:\(longitude)"
        }
        //  }
        
        
        
        mapView.addAnnotation(point2)
        
    }
    
    
    /*
    private func removeAnnotation() {
        self.mapView.removeAnnotation(point);
        
    }
    */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        // 重複使用地圖標註
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        
        for i in 1...4{
            if(missionData?.missionIntegrate[i].isAcception == true && missionData?.missionIntegrate[1].isComplete == false){
                leftIconView.image = missionData?.missionIntegrate[1].image
                
            }else if(missionData?.missionIntegrate[i - 1].isComplete == true && missionData?.missionIntegrate[i].isComplete == false){
                leftIconView.image = missionData?.missionIntegrate[i].image
            }else if(missionData?.missionIntegrate[3].isComplete == true && missionData?.missionIntegrate[4].isComplete == false){
                leftIconView.image = missionData?.missionIntegrate[4].image
            }
            
        }
        
        annotationView?.leftCalloutAccessoryView = leftIconView
        return annotationView
    }
}

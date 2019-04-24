//
//  MapViewController.swift
//  Assignment_4_Choo
//
//  Created by ITS  Unit on 22/04/2019.
//  Copyright © 2019 ITS  Unit. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        let latitude2: CLLocationDegrees = latitude!
        let longitude2: CLLocationDegrees = longitude!
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude2, longitude2)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        //var options2 = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark:placemark)
        mapItem.openInMaps(launchOptions: options)
        
    super.viewDidLoad()
        

    //textLabel.coordinates = "\[gpsCoords]"
        
        

        // Do any additional setup after loading the view. 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

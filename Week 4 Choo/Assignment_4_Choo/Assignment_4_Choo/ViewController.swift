//
//  ViewController.swift
//  Assignment_4_Choo
//
//  Created by ITS  Unit on 22/04/2019.
//  Copyright © 2019 ITS  Unit. All rights reserved.
//

import UIKit
import MapKit

var latitude: Double?
var longitude: Double?
var time: String?

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var coorArray = [String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        coorArray = externalCoords(fileName: "gps_coords")
        // Dispose of any resources that can be recreated.
    }
    
    func externalCoords(fileName: String) -> [String]{
        
        if let coords = Bundle.main.path(forResource: "gps_coords", ofType: "csv"){
            
            do{
                let coordinates = try String(contentsOfFile: coords)
                coorArray = coordinates.components(separatedBy: "\n")
                return coorArray
            }
            catch let error as NSError{
                print("File not found:\(error)")
            }
        }
        return coorArray
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int{
        let numOfCoords = externalCoords(fileName: "gps_coords")
        return numOfCoords.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var gpsCoords = externalCoords(fileName: "gps_coords")
        let cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"cell")
        cell.textLabel?.text = gpsCoords[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "mapTransfer", sender: self)
        print(coorArray[indexPath.row])
        performSegue(withIdentifier: "mapTransfer", sender: coorArray[indexPath.item])
        let newCoords = coordinates(string: coorArray[indexPath.row])
        latitude = Double(newCoords[0])
        longitude = Double(newCoords[1])
        time = newCoords[2]
    }
    
    func coordinates (string: String) -> [String]
    {
        let mapCoords = string.components(separatedBy: ";")
        return mapCoords
    }
    
    func checkLatValid (dummyLat:String, dummyLong:String, dummyNum: String) -> Bool
    {
        let Num = Double (dummyNum)
        let Lat = Double (dummyLat)
        let Long = Double (dummyLong)
        
        if (Num != nil){
            if (Lat! < Double(-90.0) || Lat! > Double(90.0)){
                return false
            }
            else if (Long! < (-180.0) || Long! > Double(180.0)){
                return false
            }
            else{
                return true
            }
        }
        else{
            return false
        }
        
    }


}


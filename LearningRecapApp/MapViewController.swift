//
//  MapViewController.swift
//  WaterApp
//
// INcollated by Vincenzo Pugliese, created by Grazia Mazzei on 09/12/17.
//  Copyright © 2017 Raffaele. All rights reserved.

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {
    

    
    // We need this file to save the location
    var latitude: Float = 0.0;
    var longitude: Float = 0.0;
    
    // Location
    var locationManager = CLLocationManager()
    
    // I get the User_Id
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    
    var gradientLayer: CAGradientLayer?;
    

    let regionRadius: CLLocationDistance = 15000;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        Thread.sleep(forTimeInterval: 1.4)


        mapView.delegate = self as! MKMapViewDelegate
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges();
        
        if let location = locationManager.location {
            centerMapOnLocation(location: location );
        } else {
            createAlertMessage(NSLocalizedString("error", comment: ""), NSLocalizedString("errorgeo", comment: ""));
        }
        
        mapView.showsUserLocation = true;

        
        mapView.showsCompass = false
    }
    
    // Update the constraint and the gradient after a rotation
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    }
    
    // MAP TYPE SEGMENTED
    @IBAction func mapTypeSelector(_ sender: Any) {
        switch ((sender as AnyObject).selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .standard
        }
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func createrMarker(_ latitude: Float ,_ longitude: Float,_ valueEnterococchi: Int, _ valueEscherichia: Int) {
      
    }
    
    //    -------------------READ FROM FILE-------------------

    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with:"\n")
        return cleanFile
    }
    
    func getStringFieldsForRow(row: String, delimiter:String)-> [String]{
        return row.components(separatedBy: delimiter)
    }
    
    /*  SEARCH LOCATIONS OF ANALYSIS AND CREATE FLAGS */
    
    func createFlags(_ data: [[String]],_ indexLongitude: Int,_ indexLatitude: Int,_ indexEnterococchi: Int,
                     _ indexEscherichia: Int ){
        // Inital value
        var latitude: Float = Float(data[0][indexLatitude])!
        var longitude: Float = Float(data[0][indexLongitude])!
        var valueEnterococchi: Int = Int(data[0][indexEnterococchi])!;
        var valueEscherichia: Int = Int(data[0][indexEscherichia])!;
        
        for  i in 1...data.count-1 {
            
            if( (Float(data[i][indexLongitude]) ?? 0) != 0) {
                
                if( latitude != Float(data[i][indexLatitude]) || longitude != Float(data[i][indexLongitude])) {
                    // Create a merker in the previous point
                    createrMarker(longitude,latitude, valueEnterococchi, valueEscherichia );
                    // Set the new values
                    latitude = Float(data[i][indexLatitude])!
                    longitude = Float (data[i][indexLongitude])!
                }
                // update only the values of bacterias
                valueEnterococchi = Int(data[i][indexEnterococchi])!;
                valueEscherichia = Int(data[i][indexEscherichia])!;
            } else {
                if( latitude != Float(data[i][indexLatitude+1]) || longitude != Float(data[i][indexLongitude+1])) {
                    // Create a merker in the previous point
                    createrMarker(longitude,latitude, valueEnterococchi, valueEscherichia );
                    // Set the new values
                    latitude = Float(data[i][indexLatitude+1])!
                    longitude = Float (data[i][indexLongitude+1])!
                    
                } else {
                    if( latitude != Float(data[i][indexLatitude+1]) || longitude != Float(data[i][indexLongitude+1])) {
                        // Create a merker in the previous point
                        createrMarker(longitude,latitude, valueEnterococchi, valueEscherichia );
                        // Set the new values
                        latitude = Float(data[i][indexLatitude+1])!
                        longitude = Float (data[i][indexLongitude+1])!
                    }
                }
                valueEnterococchi = Int(data[i][indexEscherichia+1])!
                valueEscherichia = Int(data[i][indexEscherichia+1])!;
            }
        }
    }
    
    func searchInArray(_ data: Array<Array<String>>, _ indexLatitude: Int,_ indexLongitude: Int,_ latitudeValue: Float,
                       _ longitudeValue: Float) -> Array<Array<String>> {
        var values = Array<Array<String>>();
        
        // I start a cycle
        for i in 3...data.count-1{
            // If I haven't an error during the conversation of the String to Float
            if( (Float(data[i][indexLongitude]) ?? 0) != 0) {
                if( latitudeValue == Float(data[i][indexLatitude]) && longitudeValue == Float(data[i][indexLongitude])) {
                    // I have fouund the location so i punt in the array-2D
                    values.append(data[i]);
                }
                
            } else {
                
                if( latitudeValue == Float(data[i][indexLatitude+1]) && longitudeValue == Float(data[i][indexLongitude+1])) {
                    values.append(data[i]);
                }
            }
        }
        
        return values;
    }
    
    //   --------------------- MAPKIT -----------------------
    
    @IBOutlet weak var mapView: MKMapView!

    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    // HIDE LEGEND AND BUTTONS WHEN MAP IS MOVING
    // SEARCH BAR
    
    
    
    // CREATE ALLERT
    func createAlertMessage(_ mTitle:String, _ mMessage: String) {
        
        let alertMessage = UIAlertController(title: mTitle, message: mMessage, preferredStyle: .alert)
        // Attach an action on alert message
        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alertMessage.dismiss(animated: true, completion: nil)
        }))
        // Display the alert message
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    // ADD A GRADIENT TO VIEW
    func gradientToView(view : UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer!.frame.size = view.frame.size
        gradientLayer!.locations = [0.0, 1.0]
        gradientLayer!.cornerRadius = 6;
        view.layer.insertSublayer(gradientLayer!, at: 0);
        
    }

}
extension MapViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchCompleter.queryFragment = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//
//  DailyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by Felicity Johnson on 10/29/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation

class DailyTableViewController: UITableViewController {

    let dataStore = WeatherDataStore.sharedInstance
    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.title = "Daily"
        
        dataStore.addForecasts { 
            DispatchQueue.main.async {
                self.setupLocationManager()
                self.tableView.reloadData()
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.dailyWeatherReports.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyTableViewCell

        cell.maxTempLabel.text = String(dataStore.dailyWeatherReports[indexPath.row].dailyTemperatureMax)
        cell.minTempLabel.text = String(dataStore.dailyWeatherReports[indexPath.row].dailyTemperatureMin)
        cell.dailySummaryLabel.text = dataStore.dailyWeatherReports[indexPath.row].dailyDescription

        return cell
    }

}

extension DailyTableViewController: CLLocationManagerDelegate {
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
            self.latitude = unwrappedlatitude
            self.longitude = unwrappedLongitude
            self.dataStore.latitude = self.latitude
            self.dataStore.longitude = self.longitude

        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


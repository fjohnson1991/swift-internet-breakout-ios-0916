//
//  HourlyTableVC.swift
//  niftyFlatironWeather
//
//  Created by Felicity Johnson on 10/29/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit


class HourlyTableVC: UITableViewController {
    let dataStore = WeatherDataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.navigationItem.title = "Hourly"
        self.tabBarController?.navigationController?.navigationItem.title = "Hourly"
        dataStore.addForecasts({
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataStore.hourlyWeatherReports.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyCell", for: indexPath) as! HourlyTableViewCell
     cell.tempLabel.text = String(dataStore.hourlyWeatherReports[indexPath.row].hourlyTemperature)
     cell.summaryLabel.text = dataStore.hourlyWeatherReports[indexPath.row].hourlyDescription
     return cell
    }

}



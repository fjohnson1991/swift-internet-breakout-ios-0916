//
//  WeatherAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Forrest Zhao on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class WeatherApiClient {
    
    class func getHourlyForecast(with completion: @escaping (Bool, [String: Any]) -> Void) {
        
        let url = URL(string: "https://api.darksky.net/forecast/\(key)/\(WeatherDataStore.sharedInstance.latitude),\(WeatherDataStore.sharedInstance.longitude)")

        let session: URLSession = URLSession.shared
        guard let unwrappedUrl = url else { return }
        
        let task = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let unwrappedData = data {
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                        let hourlyData = responseJSON["hourly"] as! [String:Any]
                        let hourlyDataJson = hourlyData["data"] as! [[String: Any]]
                        for hour in hourlyDataJson {
                            completion(true, hour)
                        }
                        
                    }
                    catch {
                        
                    }
                }
            }
            else{
                //display alert
                print(httpResponse.statusCode)
            }
        }
        task.resume()
    }
    
    
    
    class func getDailyForecast(with completion: @escaping ([String: Any]) -> Void) {
        let url = URL(string: "https://api.darksky.net/forecast/\(key)/\(WeatherDataStore.sharedInstance.latitude),\(WeatherDataStore.sharedInstance.longitude)")
 
        let session: URLSession = URLSession.shared
        guard let unwrappedUrl = url else { return }
        
        let task = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let unwrappedData = data {
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                        let dailyData = responseJSON["daily"] as! [String:Any]
                        let dailyDataJson = dailyData["data"] as! [[String: Any]]
                        for daily in dailyDataJson {
                        completion(daily)
                        }
                    }catch {
                        
                    }
                }
                    
                else{
                    print(httpResponse.statusCode)
                }
            }
        }
        task.resume()
        
    }
}



//
//  WeatherLocationInfo.swift
//  niftyFlatironWeather
//
//  Created by Forrest Zhao on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

class HourlyForecast {
    var hourlyTemperature: Double
    var hourlyDescription: String
    
    init(dict: [String: Any]) {
        
        self.hourlyDescription = dict["summary"] as! String
        self.hourlyTemperature = dict["temperature"] as! Double
    }
}

class DailyForecast {
    var dailyTemperatureMin: Double
    var dailyTemperatureMax: Double
    var dailyDescription: String

    init(dict: [String : Any]){
        self.dailyTemperatureMin = dict["temperatureMin"] as! Double
        self.dailyTemperatureMax = dict["temperatureMax"] as! Double
        self.dailyDescription = dict["summary"] as! String
        
    }

}

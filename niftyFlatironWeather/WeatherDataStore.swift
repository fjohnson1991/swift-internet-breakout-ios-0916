//
//  WeatherDataStore.swift
//  niftyFlatironWeather
//
//  Created by Forrest Zhao on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

class WeatherDataStore {
    
    static let sharedInstance = WeatherDataStore()
    var dailyWeatherReports: [DailyForecast] = []
    var hourlyWeatherReports: [HourlyForecast] = []
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    
    private init() { }
    
    func addForecasts(_ completion: @escaping () -> Void) {
        
        WeatherApiClient.getHourlyForecast { success, forecast in
        
            if success {
                
                self.hourlyWeatherReports.append(HourlyForecast(dict: forecast))
                
                WeatherApiClient.getDailyForecast { forecast in
                    
                    self.dailyWeatherReports.append(DailyForecast(dict: forecast))

                    completion()
                    
                }
            }
        }

    }
    
}


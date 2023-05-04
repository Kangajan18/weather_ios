//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by kangajan kuganathan on 2023-05-03.
//

import Foundation

protocol dataInputs {
    func fetchData(cityName:String)
}
protocol dataOutputs {
    func loadedData(data:WeatherData)
}

class WeatherModel:dataInputs {
    
    var delegate:dataOutputs?
    
    func fetchData(cityName:String) {
        let weatherApiManager  = WeatherApiManager()
        weatherApiManager.fetchWeatherData(cityName: cityName) {
            self.delegate?.loadedData(data: $0)
        }
    }
}

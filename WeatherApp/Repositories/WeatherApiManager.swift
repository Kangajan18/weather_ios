//
//  WeatherApiManager.swift
//  WeatherApp
//
//  Created by kangajan kuganathan on 2023-05-03.
//

import Foundation

class WeatherApiManager {
    
    let weatherApiUrl:String = "https://api.openweathermap.org/data/2.5/weather?units=metric&q="
    
    func fetchWeatherData(cityName:String,completed:@escaping(_ data:WeatherData)->()) {
        let finalUrl = URL(string: "\(weatherApiUrl)\(cityName)&appid=\(ApiKey.openWeatherKey.rawValue)")
        if let url = finalUrl {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, urlResponse, error in
                if let weatherData = data {
                    if let data = self.parseJson(data: weatherData){
                        DispatchQueue.main.async {
                            completed(data)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(data:Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do{
            let data = try decoder.decode(WeatherData.self, from: data)
            return data
        }catch {
            print("Error occer while parseJons , \(error)")
            return nil
        }
    }
}

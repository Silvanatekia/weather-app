//
//  ContentViewModel.swift
//  practiceapp
//
//  Created by Silvana Tekia on 18/12/2023.
//

import Foundation

class WeatherViewModel {
    var weather: Bindable<WeatherModel?> = Bindable(nil)

    func fetchWeather() {
        let apiUrl = "api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=ff50b7e3d20ecc1bb9e26105ee8c3caf"

        guard let url = URL(string: apiUrl) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }

            do {
                let londonWeatherData = try JSONDecoder().decode(LondonWeatherData.self, from: data)
                let weatherModel = WeatherModel
                    temperature: londonWeatherData.main.temp,
                    condition: londonWeatherData.weather.first?.description ?? "N/A"
                )
                self.weather.value = weatherModel
            } catch {
                print("Error decoding London weather data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
struct LondonWeatherData: Codable {
    let main: Main
    let weather: [Weather]

    struct Main: Codable {
        let temp: Double
    }

    struct Weather: Codable {
        let description: String
    }
}



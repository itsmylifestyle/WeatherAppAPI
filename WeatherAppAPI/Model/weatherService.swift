import Foundation
import Combine

struct WeatherService {
    private let apiKey = "1b3b03c834a1c2fb15fdcfda7c46d65d"
    private let baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    
    func fetchWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
        ]
        
        let url = components.url!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct WeatherResponse: Codable {
    let list: [WeatherEntry]
}

struct WeatherEntry: Codable, Identifiable {
    let dt: TimeInterval
    let main: MainWeather
    let weather: [Weather]
    
    var id: TimeInterval { dt }
}

struct MainWeather: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let description: String
    let icon: String
}

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var dailyWeather: [DailyWeather] = []
    private var cancellables = Set<AnyCancellable>()
    
    private let weatherService = WeatherService()
    
    func fetchWeather() {
        weatherService.fetchWeather(for: "Astana")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Ошибка получения данных: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.dailyWeather = self.groupWeatherByDay(entries: response.list)
            })
            .store(in: &cancellables)
    }
    
    private func groupWeatherByDay(entries: [WeatherEntry]) -> [DailyWeather] {
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: entries) { entry -> Date in
            let date = Date(timeIntervalSince1970: entry.dt)
            return calendar.startOfDay(for: date)
        }
        
        return grouped.map { (date, entries) in
            DailyWeather(date: date, entries: entries)
        }.sorted { $0.date < $1.date }
    }
}

struct DailyWeather: Identifiable {
    let date: Date
    let entries: [WeatherEntry]
    
    var id: Date { date }
}

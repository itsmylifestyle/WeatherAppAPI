import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let currentWeather = viewModel.weatherEntries.first {
                VStack {
                    Text("Текущая погода")
                        .font(.largeTitle)
                        .padding()
                    Text("\(currentWeather.main.temp, specifier: "%.1f")°C")
                        .font(.system(size: 50))
                    if let description = currentWeather.weather.first?.description {
                        Text(description)
                            .font(.title)
                    }
                }
            }
            
            Text("Прогноз на неделю")
                .font(.largeTitle)
                .padding()
            
            List(viewModel.weatherEntries) { entry in
                VStack(alignment: .leading) {
                    Text(Date(timeIntervalSince1970: entry.dt), style: .date)
                        .font(.headline)
                    Text("\(entry.main.temp, specifier: "%.1f")°C")
                        .font(.title)
                    if let description = entry.weather.first?.description {
                        Text(description)
                            .font(.subheadline)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchWeather()
        }
    }
}

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let currentWeather = viewModel.dailyWeather.first?.entries.first {
                VStack {
                    Text("Astana, Kazakhstan")
                        .font(.largeTitle)
                        .padding()
                    Text("\(Int(currentWeather.main.temp))°C")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    if let description = currentWeather.weather.first?.description {
                        Text(description)
                            .font(.title)
                    }
                }
                .padding(.bottom, 25)
            }
            
            
            Text("Weekly forecast")
                .font(.title)
                .padding()
            
            List(viewModel.dailyWeather) { daily in
                VStack(alignment: .leading, spacing: 10) {
                    Text(getDayOfWeek(from: daily.date))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    if let firstEntry = daily.entries.first {
                        Text("\(Int(firstEntry.main.temp))°C")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        if let description = firstEntry.weather.first?.description {
                            Text(description)
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.vertical, 10)
            }
        }
        .onAppear {
            viewModel.fetchWeather()
        }
    }
    
    private func getDayOfWeek(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .environmentObject(WeatherViewModel())
    }
}

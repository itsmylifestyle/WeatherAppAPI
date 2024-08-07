# Weather App

## Description

The Weather App is a simple and intuitive iOS application built using SwiftUI. It fetches weather data for Astana, Kazakhstan from the OpenWeatherMap API and displays the current weather and a weekly forecast. The app aims to provide a clean and user-friendly interface for viewing weather conditions.

> [!TIP]
> This project was developed specifically for Astana Hub - Apple Authorized Training Centre for Education.

$$Apple    Authorized    Training    Centre    for    Education$$

## Features

- **Current Weather**: Displays the current temperature, weather description, and location.
- **Weekly Forecast**: Shows the weather forecast for the upcoming week, including temperature and weather description for each day.
- **Day of the Week**: Each forecast entry displays the day of the week for better readability.

## Technologies Used

- SwiftUI: For building the user interface.
- Combine: For handling asynchronous data fetching and binding.
- OpenWeatherMap API: For fetching weather data.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/weather-app.git
    ```
2. Open the project in Xcode:
    ```sh
    cd weather-app
    open WeatherApp.xcodeproj
    ```
3. Make sure you have Xcode installed on your Mac. You can download it from the App Store.

## Configuration

1. Obtain an API key from [OpenWeatherMap](https://openweathermap.org/api).
2. In the `WeatherService` class, replace `YOUR_API_KEY` with your actual API key:
    ```swift
    private let apiKey = "YOUR_API_KEY"
    ```

## Usage

1. Run the app on the simulator or a physical device.
2. The app will display the current weather in Astana, Kazakhstan.
3. Scroll down to see the weekly weather forecast.

## Code Structure

- `WeatherView`: The main view displaying the current weather and weekly forecast.
- `WeatherViewModel`: The view model responsible for fetching and managing weather data.
- `WeatherService`: The service class responsible for making API calls to OpenWeatherMap.
- `DailyWeather` and `WeatherEntry`: Models representing the weather data.

## Preview

The project includes a preview feature that allows you to see the UI with mock data in Xcode. This is useful for designing and testing the UI without making API calls.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any features, bug fixes, or enhancements.

## Contact

If you have any questions or feedback, please reach out to us at hahaii00@mail.ru.

---

Thank you for using the Weather App! We hope it helps you stay informed about the weather in Astana, Kazakhstan.

---

## Sample Photo

### Here's a sample of the project:
<img width="393" alt="image" src="https://github.com/user-attachments/assets/a15ca635-a234-4808-85f3-e88ea79857c2">




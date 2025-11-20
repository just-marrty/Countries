# Countries

A SwiftUI application for displaying a list of countries using modern Swift technologies.

## Features

- Display a list of countries with their basic information
- Fetch data from REST Countries API
- Loading state and error handling

## Architecture

The project uses **MVVM (Model-View-ViewModel)** architecture:

- **Model**: `Country` - data model for representing a country
- **View**: `ContentView` - SwiftUI view for displaying data
- **ViewModel**: `CountriesViewModel` - business logic and application state
- **Service**: `FetchService` - service for API communication

## Technologies

- **Async/Await**: Asynchronous data fetching from API using modern Swift async/await pattern
- **REST API**: Integration with REST Countries API (https://restcountries.com)
- **SwiftUI**: Modern declarative UI framework
- **Observable**: Using `@Observable` macro for reactive UI updates

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

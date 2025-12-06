# Countries

A SwiftUI application for browsing and exploring countries with detailed information fetched from REST Countries API.

## Features

- Browse a list of countries with their basic information
- Search functionality to filter countries by name
- Real-time search filtering with smooth animations
- Light and dark mode toggle with persistent preference
- Loading states and error handling with retry functionality
- Clean and modern UI with SwiftUI

## Architecture

The project demonstrates modern SwiftUI patterns and MVVM architecture:

### Model

- **Country** - Decodable model representing country data from API
  - Nested `Names` struct for common and official names
  - Conforms to `Decodable` for JSON parsing
  - Includes capital cities and region information

### Service

- **FetchService** - Fetches and decodes country data from REST Countries API
  - Uses `URLSession` with async/await for network requests
  - Custom error handling with `FetchError` enum
  - Fetches data from `https://restcountries.com/v3.1/all`
  - Uses `JSONDecoder` for parsing API responses

### ViewModel

- **CountryListViewModel** - Manages application state and business logic
  - Uses `@Observable` macro for reactive UI updates
  - `@MainActor` for thread-safe UI updates
  - Dependency injection via initializer (receives `FetchService`)
  - Search functionality with case-insensitive filtering
  - Loading and error state management

- **CountryViewModel** - Presentation model wrapping `Country`
  - Conforms to `Identifiable` for SwiftUI list support
  - Provides computed properties for view display
  - Separates domain model from presentation concerns

### Views

- **ContentView** - Main container with searchable country list and dark mode toggle
  - Uses `@AppStorage` for persistent dark mode preference
  - Real-time search filtering with `searchable` modifier
  - NavigationStack for navigation
  - Loading, error, and content states
  - Toolbar button for theme switching

### Dependency Injection

The project uses **constructor-based dependency injection**:

- `CountryListViewModel` receives `FetchService` as a dependency through its initializer
- This allows for easy testing and swapping implementations
- `FetchService` is injected in `ContentView` when creating the ViewModel
- Promotes loose coupling and testability

### State Management

- `@State` for local view state (search text, ViewModel instance)
- `@AppStorage` for persistent dark mode preference
- `@Observable` macro for reactive ViewModel updates
- Reactive filtering with `searchable` modifier and computed properties

## Technologies

- **SwiftUI** - Modern declarative UI framework
- **Async/Await** - Asynchronous data fetching from API using modern Swift concurrency
- **REST API** - Integration with REST Countries API (https://restcountries.com)
- **NavigationStack** - Programmatic navigation
- **JSON Decoding** - Custom `Decodable` implementation with nested structures
- **Searchable** - Built-in search functionality with real-time filtering
- **AppStorage** - Persistent user preferences for theme
- **Observable** - Using `@Observable` macro for reactive UI updates
- **Dependency Injection** - Constructor-based DI for testability and flexibility
- **Animation** - Smooth transitions with default SwiftUI animations

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

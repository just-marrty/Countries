# Countries

SwiftUI aplikace pro zobrazení seznamu zemí s použitím moderních Swift technologií.

## Funkce

- Zobrazení seznamu zemí s jejich základními informacemi
- Načítání dat z REST Countries API
- Zobrazení stavu načítání a chybových hlášek

## Architektura

Projekt využívá **MVVM (Model-View-ViewModel)** architekturu:

- **Model**: `Country` - datový model pro reprezentaci země
- **View**: `ContentView` - SwiftUI view pro zobrazení dat
- **ViewModel**: `CountriesViewModel` - business logika a stav aplikace
- **Service**: `FetchService` - služba pro komunikaci s API

## Technologie

- **Async/Await**: Asynchronní načítání dat z API pomocí moderního Swift async/await patternu
- **REST API**: Integrace s REST Countries API (https://restcountries.com)
- **SwiftUI**: Moderní deklarativní UI framework
- **Observable**: Použití `@Observable` makra pro reaktivní aktualizace UI

## Struktura projektu

Countries/
├── Model/
│ └── Country.swift # Datový model
├── ViewModel/
│ └── CountriesViewModel.swift # ViewModel s business logikou
├── Services/
│ └── FetchService.swift # Služba pro API komunikaci
├── ContentView.swift # Hlavní SwiftUI view
└── CountriesApp.swift # Entry point aplikace

## Požadavky

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

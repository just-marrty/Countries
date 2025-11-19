//
//  ContentView.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = CountriesViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error")
                            .font(.headline)
                        Text(error)
                            .foregroundColor(.secondary)
                        Button("Try again") {
                            Task {
                                await viewModel.loadCountries()
                            }
                        }
                    }
                } else {
                    List(viewModel.countries, id: \.name) { country in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(country.name)
                                .font(.headline)
                            Text(country.officialName) 
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            if let nativeName = country.nativeName?["ara"] {
                                Text("Native name: \(nativeName.common)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            if let capital = country.capital?.first {
                                Text("Capital city: \(capital)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Text("Region: \(country.region)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Countries")
            .task {
                await viewModel.loadCountries()
            }
        }
    }
}

#Preview {
    ContentView()
}

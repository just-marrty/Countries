//
//  ContentView.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkOn") private var isDarkOn: Bool = false
    
    @State private var vm = CountryListViewModel(fetchService: FetchService())
    
    @State private var searchText: String = ""
    
    var body: some View {
        Group {
            if vm.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = vm.errorMessage {
                VStack {
                    Text("Error")
                        .font(.headline)
                    Text(errorMessage)
                        .foregroundColor(.secondary)
                    Button("Try again") {
                        Task {
                            await vm.loadCountries()
                        }
                    }
                }
            } else {
                NavigationStack {
                    List(vm.search(for: searchText)) { country in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(country.nameCommon)
                                .font(.system(size: 18))
                                .bold()
                            
                            Text("Official name: \(country.nameOfficial)")
                                .font(.subheadline)
                            
                            Text("Region: \(country.region)")
                                .font(.subheadline)
                        }
                    }
                    .navigationTitle("Countries")
                    .toolbarBackgroundVisibility(.visible, for: .navigationBar)
                    .navigationBarItems(trailing: Button(action: {
                        isDarkOn.toggle()
                    }, label: {
                        Image(systemName: isDarkOn ? "moon.fill" : "sun.max.fill")
                            .foregroundStyle(isDarkOn ? .white : .black)
                    }))
                    .listStyle(.plain)
                    .searchable(text: $searchText, prompt: "Search country")
                    .animation(.default, value: searchText)
                    .scrollIndicators(.hidden)
                }
            }
        }
        .preferredColorScheme(isDarkOn ? .dark : .light)
        .tint(isDarkOn ? .white : .primary)
        .task {
            await vm.loadCountries()
        }
    }
}

#Preview {
    ContentView()
}

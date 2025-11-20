//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import Foundation

@Observable
@MainActor
class CountriesViewModel {
    var countries: [Country] = []
    var isLoading = false
    var errorMessage: String?
    
    private let fetchService = FetchService()
    
    func loadCountries() async {
        isLoading = true
        errorMessage = nil
        
        do {
            countries = try await fetchService.fetchCountries()
        } catch {
            errorMessage = "Cannot load data: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

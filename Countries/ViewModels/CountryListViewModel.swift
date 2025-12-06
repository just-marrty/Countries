//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import Foundation
import Observation

@Observable
@MainActor
class CountryListViewModel {
    var countries: [CountryViewModel] = []
    var isLoading = false
    var errorMessage: String?
    
    private let fetchService: FetchService
    
    init(fetchService: FetchService) {
        self.fetchService = fetchService
    }
    
    func loadCountries() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let countries = try await fetchService.fetchCountries()
            self.countries = countries.map(CountryViewModel.init)
        } catch {
            errorMessage = "Cannot load data: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func search(for searchTherm: String) -> [CountryViewModel] {
        if searchTherm.isEmpty {
            return countries
        } else {
            return countries.filter { country in
                country.nameCommon.localizedCaseInsensitiveContains(searchTherm)
            }
        }
    }
}

struct CountryViewModel: Identifiable {
    
    private var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var id: UUID {
        country.id
    }
    
    var nameCommon: String {
        country.name.common
    }
    
    var nameOfficial: String {
        country.name.official
    }
    
    var capital: [String]? {
        country.capital
    }
    
    var region: String {
        country.region
    }
}

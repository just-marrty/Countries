//
//  FetchService.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
        case invalidURL
    }
    
    private let baseURL = "https://restcountries.com/v3.1/all?fields=name,capital,region"
    
    func fetchCountries() async throws -> [Country] {
        guard let url = URL(string: baseURL) else {
            throw FetchError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON")
            print(jsonString.prefix(500))
        }
        do {
            return try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
}

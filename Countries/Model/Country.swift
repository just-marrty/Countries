//
//  Country.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import Foundation

struct Country: Decodable {
    var id = UUID()
    
    let name: Names
    let capital: [String]?
    let region: String
    
    struct Names: Decodable {
        let common: String
        let official: String
    }
    
    enum CodingKeys: CodingKey {
        case name
        case capital
        case region
    }
}

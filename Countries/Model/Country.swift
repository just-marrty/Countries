//
//  Country.swift
//  Countries
//
//  Created by Martin Hrbáček on 19.11.2025.
//

import Foundation

struct Country: Decodable {
    let name: String
    let officialName: String
    let nativeName: [String: NativeName]?
    let capital: [String]?
    let region: String
    
    struct NativeName: Decodable {
        let official: String
        let common: String
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case region
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Dekódujeme name jako nested container a bereme jen "common"
        let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
        self.name = try nameContainer.decode(String.self, forKey: .common)
        
        self.officialName = try nameContainer.decode(String.self, forKey: .official)
        self.nativeName = try nameContainer.decodeIfPresent([String: NativeName].self, forKey: .nativeName)
        
        self.capital = try container.decodeIfPresent([String].self, forKey: .capital)
        self.region = try container.decode(String.self, forKey: .region)
    }
    
    private enum NameKeys: String, CodingKey {
        case common
        case official
        case nativeName
    }
}

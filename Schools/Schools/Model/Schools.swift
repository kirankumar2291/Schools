//
//  Schools.swift
//  Schools
//
//  Created by Kiran Kumar on 29/01/24.
//

import Foundation

struct Schools: Identifiable, Codable {
    var id = UUID()
    
    let school_name: String
    let dbn: String
    let overview_paragraph: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.school_name = try container.decode(String.self, forKey: .school_name)
        self.dbn = try container.decode(String.self, forKey: .dbn)
        self.overview_paragraph = try container.decode(String.self, forKey: .overview_paragraph)
    }
}

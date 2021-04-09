//
//  Flights.swift
//  Airport App
//
//  Created by Jose Torres on 4/8/21.
//

import Foundation

struct Flights {
    
    let flights: [Flight]
}

extension Flights: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case flights = "Resultados"
    }
}


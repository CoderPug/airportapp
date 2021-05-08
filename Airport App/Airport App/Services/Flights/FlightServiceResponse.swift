//
//  FlightServiceResponse.swift
//  Airport App
//
//  Created by Jose Torres on 5/8/21.
//

import Foundation

struct FlightsServiceResponse {
    
    let flights: [Flight]
}

extension FlightsServiceResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case flights = "Resultados"
    }
}

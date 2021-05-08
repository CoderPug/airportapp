//
//  FlightsServiceRequest.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation

public struct FlightsServiceRequest {
    
    let date: String
    let operation: String
    let destination: String?
    let origin: String?
    let flight: String?
    
    init(date: String,
         operation: String,
         destination: String? = nil,
         origin: String? = nil,
         flight: String? = nil) {
        self.date = date
        self.operation = operation
        self.destination = destination
        self.origin = origin
        self.flight = flight
    }
}

// MARK: Encodable

extension FlightsServiceRequest: Encodable {
    enum CodingKeys: String, CodingKey {
        
        case date = "fecha"
        case operation = "operacion"
        case destination = "destino"
        case origin = "origen"
        case flight = "vuelo"
    }
}

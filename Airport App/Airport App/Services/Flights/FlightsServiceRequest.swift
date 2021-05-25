//
//  FlightsServiceRequest.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation

public struct FlightsServiceRequest {
    
    let date: String?
    let operation: String?
    let destination: String?
    let origin: String?
    let flight: String?
    
    init(date: String? = nil,
         operation: String? = nil,
         origin: String? = nil,
         destination: String? = nil,
         flight: String? = nil) {
        self.date = date
        self.operation = operation
        self.origin = origin
        self.destination = destination
        self.flight = flight
    }
}

// MARK: Encodable

extension FlightsServiceRequest: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case date = "fecha"
        case operation = "operacion"
        case origin = "origen"
        case destination = "destino"
        case flight = "vuelo"
    }
}

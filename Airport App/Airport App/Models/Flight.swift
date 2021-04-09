//
//  Flight.swift
//  Airport App
//
//  Created by Jose Torres on 4/8/21.
//

import Foundation

enum FlightType: String {
    case arrival = "L"
    case departure = "S"
}

enum FlightOriginType: String {
    case national = "N"
    case international = "I"
}

struct Flight {
    
    let airline: String
    let code: String
    let destination: String
    let state: String
    let scheduledDate: String
    let scheduledHour: String
    let estimatedHour: String
    let flightNumber: String
    let baggageCarousel: String
    let boardingGate: String?
    let flightType: FlightType
    let flightOriginType: FlightOriginType
}

// MARK: Decodable

extension FlightType: Decodable { }

extension FlightOriginType: Decodable { }

extension Flight: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case airline = "aerolinea"
        case code = "codvuelo"
        case destination = "destino"
        case state = "estado"
        case scheduledDate = "fechaprogramada"
        case scheduledHour = "horaprogramada"
        case estimatedHour = "horaestimada"
        case flightNumber = "nrovuelo"
        case baggageCarousel = "numfaja"
        case boardingGate = "puertaembarque"
        case flightType = "tipope"
        case flightOriginType = "tiporigen"
    }
}

//
//  Flight.swift
//  Airport App
//
//  Created by Jose Torres on 4/8/21.
//

import Foundation

struct Flight {
    
    let airline: String
    let code: String
    let destination: String
    let state: FlightState
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        airline = try values.decode(String.self, forKey: .airline)
        destination = try values.decode(String.self, forKey: .destination)
        code = try values.decode(String.self, forKey: .code)
        scheduledDate = try values.decode(String.self, forKey: .scheduledDate)
        scheduledHour = try values.decode(String.self, forKey: .scheduledHour)
        estimatedHour = try values.decode(String.self, forKey: .estimatedHour)
        flightNumber = try values.decode(String.self, forKey: .flightNumber)
        baggageCarousel = try values.decode(String.self, forKey: .baggageCarousel)
        boardingGate = try values.decodeIfPresent(String.self, forKey: .boardingGate)
        flightOriginType = try values.decode(FlightOriginType.self, forKey: .flightOriginType)
        flightType = try values.decode(FlightType.self, forKey: .flightType)

        switch flightType {
        case .arrival:
            let object = try? values.decode(ArrivalState.self, forKey: .state)
            state = .arrivalState(arrivalState: object ?? .unknown)
        case .departure:
            let object = try? values.decode(DepartureState.self, forKey: .state)
            state = .departureState(departureState: object ?? .unknown)
        }
    }
}

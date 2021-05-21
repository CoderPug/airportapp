//
//  FlightState.swift
//  Airport App
//
//  Created by Jose Torres on 5/21/21.
//

import Foundation

enum FlightState {
    case departureState(departureState: DepartureState)
    case arrivalState(arrivalState: ArrivalState)
}

enum ArrivalState: String {
    case scheduled = "PROGRAMADO"
    case confirmed = "CONFIRMADO"
    case delayed = "DEMORADO"
    case canceled = "CANCELADO"
    case landed = "ATERRIZO"
    case unknown
}

enum DepartureState: String {
    case scheduled = "PROGRAMADO"
    case confirmed = "CONFIRMADO"
    case delayed = "DEMORADO"
    case boarding = "EMBARCANDO"
    case lastCall = "ULT LLAMAD"
    case boarded = "FIN EMBARQ"
    case canceled = "CANCELADO"
    case unknown
}

// MARK: Localization

extension FlightState {
    
    public func value() -> String {
        switch self {
        case .arrivalState(arrivalState: let state):
            return state.value()
        case .departureState(departureState: let state):
            return state.value()
        }
    }
}

extension ArrivalState {
    
    public func value() -> String {
        switch self {
        case .scheduled:
            return "Programado".uppercased()
        case .confirmed:
            return "Confirmado".uppercased()
        case .delayed:
            return "Demorado".uppercased()
        case .canceled:
            return "Cancelado".uppercased()
        case .landed:
            return "Aterrizo".uppercased()
        case .unknown:
            return "-"
        }
    }
}

extension DepartureState {
    
    public func value() -> String {
        switch self {
        case .scheduled:
            return "Programado".uppercased()
        case .confirmed:
            return "Confirmado".uppercased()
        case .delayed:
            return "Demorado".uppercased()
        case .boarding:
            return "Embarcando".uppercased()
        case .lastCall:
            return "Ultima Llamada".uppercased()
        case .boarded:
            return "Embarcado".uppercased()
        case .canceled:
            return "Cancelado".uppercased()
        case .unknown:
            return "-"
        }
    }
}

// MARK: Decodable

extension FlightState: Decodable {
    init(from decoder: Decoder) throws {
        throw DecodableError.methodUnsupported
    }
}

extension DepartureState: Decodable { }

extension ArrivalState: Decodable { }

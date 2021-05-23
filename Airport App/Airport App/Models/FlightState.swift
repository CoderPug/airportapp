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
    
    public func color() -> (Double, Double, Double) {
        switch self {
        case .arrivalState(arrivalState: let state):
            return state.color()
        case .departureState(departureState: let state):
            return state.color()
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
    
    public func color() -> (Double, Double, Double) {
        switch self {
        case .scheduled:
            return (73.0/255.0, 88.0/255.0, 103.0/255.0)
        case .confirmed:
            return (73.0/255.0, 88.0/255.0, 103.0/255.0)
        case .delayed:
            return (255.0/255.0, 133.0/255.0, 82.0/255.0)
        case .canceled:
            return (249.0/255.0, 65.0/255.0, 68.0/255.0)
        case .landed:
            return (87.0/255.0, 204.0/255.0, 153.0/255.0)
        case .unknown:
            return (73.0/255.0, 88.0/255.0, 103.0/255.0)
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
    
    public func color() -> (Double, Double, Double) {
        switch self {
        case .scheduled:
            return (73.0/255.0, 88.0/255.0, 103.0/255.0)
        case .confirmed:
            return (73.0/255.0, 88.0/255.0, 103.0/255.0)
        case .delayed:
            return (255.0/255.0, 133.0/255.0, 82.0/255.0)
        case .boarding:
            return (255.0/255.0, 200.0/255.0, 87.0/255.0)
        case .lastCall:
            return (255.0/255.0, 200.0/255.0, 87.0/255.0)
        case .boarded:
            return (87.0/255.0, 204.0/255.0, 153.0/255.0)
        case .canceled:
            return (249.0/255.0, 65.0/255.0, 68.0/255.0)
        case .unknown:
            return (73.0/255.0, 88.0/255.0, 103.0/255.0)
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

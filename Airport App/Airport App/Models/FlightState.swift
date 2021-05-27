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
            return NSLocalizedString("Scheduled", comment: "Scheduled Arrival State title")
        case .confirmed:
            return NSLocalizedString("Confirmed", comment: "Confirmed Arrival State title")
        case .delayed:
            return NSLocalizedString("Delayed", comment: "Delayed Arrival State title")
        case .canceled:
            return NSLocalizedString("Canceled", comment: "Canceled Arrival State title")
        case .landed:
            return NSLocalizedString("Landed", comment: "Landed Arrival State title")
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
            return NSLocalizedString("Scheduled", comment: "Scheduled Arrival State title")
        case .confirmed:
            return NSLocalizedString("Confirmed", comment: "Confirmed Arrival State title")
        case .delayed:
            return NSLocalizedString("Delayed", comment: "Delayed Arrival State title")
        case .boarding:
            return NSLocalizedString("Boarding", comment: "Canceled Arrival State title")
        case .lastCall:
            return NSLocalizedString("Last Call", comment: "Canceled Arrival State title")
        case .boarded:
            return NSLocalizedString("Boarded", comment: "Canceled Arrival State title")
        case .canceled:
            return NSLocalizedString("Canceled", comment: "Canceled Arrival State title")
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

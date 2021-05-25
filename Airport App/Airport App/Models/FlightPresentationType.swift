//
//  FlightPresentationType.swift
//  Airport App
//
//  Created by Jose Torres on 5/23/21.
//

import Foundation

enum FlightPresentationType: String {
    case internationalArrival
    case internationalDeparture
    case nationalArrival
    case nationalDeparture
}

extension FlightPresentationType: CaseIterable { }

extension FlightPresentationType {
    
    public func value() -> String {
        switch self {
        case .internationalArrival:
            return "International Arrivals"
        case .internationalDeparture:
            return "International Departures"
        case .nationalArrival:
            return "National Arrivals"
        case .nationalDeparture:
            return "National Departures"
        }
    }
}

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
            return NSLocalizedString("International Arrivals", comment: "International Arrivals title")
        case .internationalDeparture:
            return NSLocalizedString("International Departures", comment: "International Departures title")
        case .nationalArrival:
            return NSLocalizedString("National Arrivals", comment: "National Arrivals title")
        case .nationalDeparture:
            return NSLocalizedString("National Departures", comment: "National Departures title")
        }
    }
}

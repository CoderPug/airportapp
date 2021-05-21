//
//  FlightOriginType.swift
//  Airport App
//
//  Created by Jose Torres on 5/21/21.
//

import Foundation

enum FlightOriginType: String {
    case national = "N"
    case international = "I"
}

// MARK: Decodable

extension FlightOriginType: Decodable { }

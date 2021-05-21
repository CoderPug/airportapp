//
//  FlightType.swift
//  Airport App
//
//  Created by Jose Torres on 5/21/21.
//

import Foundation

enum FlightType: String {
    case arrival = "L"
    case departure = "S"
}

// MARK: Decodable

extension FlightType: Decodable { }

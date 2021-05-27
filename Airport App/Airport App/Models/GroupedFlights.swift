//
//  GroupedFlights.swift
//  Airport App
//
//  Created by Jose Torres on 5/23/21.
//

import Foundation

struct GroupedFlights {
    
    let date: Date
    let flights: [Flight]
    
    init?(date: String, flights: [Flight]) {
        guard let date = Date.from(date) else { return nil }
        self.date = date
        self.flights = flights
    }    
}

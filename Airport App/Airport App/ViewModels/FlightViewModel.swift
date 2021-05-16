//
//  FlightViewModel.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import Foundation

public final class FlightViewModel {
    
    var airline: Dynamic<String>
    var code: Dynamic<String>
    var destination: Dynamic<String>

    init(_ flight: Flight) {
        self.airline = Dynamic(flight.airline)
        self.code = Dynamic(flight.code)
        self.destination = Dynamic(flight.destination)
    }
        
}

//
//  FlightViewModel.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import Foundation
import UIKit

public final class FlightViewModel {
    
    var airline: Dynamic<String>
    var code: Dynamic<String>
    var flightNumber: Dynamic<String>
    var destination: Dynamic<String>
    var state: Dynamic<String>
    var date: Dynamic<String>
    var hour: Dynamic<String>
    var gate: Dynamic<String>
    var carousel: Dynamic<String>
    let type: FlightType
    let originType: FlightOriginType
    let stateColor: UIColor
        
    init(_ flight: Flight) {
        self.airline = Dynamic(flight.airline)
        self.code = Dynamic(flight.code)
        self.flightNumber = Dynamic(flight.flightNumber)
        self.destination = Dynamic(flight.destination)
        self.state = Dynamic(flight.state.value())
        let date = Date.from(flight.scheduledDate)
        self.date = Dynamic(date?.toPresentationFormat() ?? "")
        self.hour = Dynamic(flight.scheduledHour)
        self.gate = Dynamic(flight.boardingGate ?? "-")
        self.carousel = Dynamic(flight.baggageCarousel)
        self.type = flight.flightType
        self.originType = flight.flightOriginType
        let color = flight.state.color()
        self.stateColor = UIColor(red: CGFloat(color.0),
                                  green: CGFloat(color.1),
                                  blue: CGFloat(color.2),
                                  alpha: 1.0)
    }
}

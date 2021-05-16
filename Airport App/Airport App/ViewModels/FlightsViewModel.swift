//
//  FlightsViewModel.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation
import UIKit

public final class FlightsViewModel {
    
    private var flightsService: FlightsServiceItem
    private var flightServiceRequest: FlightsServiceRequest?
    
    private var flights: [Flight] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    public var reloadTableViewClosure: (() -> ())?
    public var numberOfItems: Int {
        return flights.count
    }
        
    init() {
        self.flights = []
        self.flightsService = FlightsServiceItem()
    }
    
    public func loadFlights() {
        let sampleBody = FlightsServiceRequest(date: "2021-05-15", operation: "L")
        flightsService.getFlights(sampleBody) { [weak self] result in
            switch (result) {
            case .success(let response):
                print(response.flights)
                self?.flights = response.flights
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func getFlight(for indexPath: IndexPath) -> FlightViewModel {
        let flight = flights[indexPath.row]
        return FlightViewModel(flight)
    }
}

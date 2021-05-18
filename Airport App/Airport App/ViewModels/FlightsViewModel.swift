//
//  FlightsViewModel.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation
import UIKit

public final class FlightsViewModel {
    
    private var flightsService: FlightsService
    private var flightServiceRequest: FlightsServiceRequest?
    
    private var flights: [Flight] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    public var reloadTableViewClosure: (() -> Void)?
    public var numberOfItems: Int {
        return flights.count
    }
    
    init(service: FlightsService) {
        self.flights = []
        self.flightsService = service
    }
    
    public func getFlight(for indexPath: IndexPath) -> FlightViewModel? {
        guard self.flights.count > indexPath.row else { return nil }
        let flight = flights[indexPath.row]
        return FlightViewModel(flight)
    }
}

// MARK: Intents

extension FlightsViewModel {
    
    public func loadInternationalArrival(for date: Date = Date()) {
        load(for: date, type: .arrival, origin: .international)
    }
    
    public func loadNationalArrival(for date: Date = Date()) {
        load(for: date, type: .arrival, origin: .national)
    }
    
    public func loadInternationalDeparture(for date: Date = Date()) {
        load(for: date, type: .departure, origin: .international)
    }
    
    public func loadNationalDeparture(for date: Date = Date()) {
        load(for: date, type: .departure, origin: .national)
    }
    
    private func load(for date: Date, type: FlightType, origin: FlightOriginType? = nil) {
        let body = FlightsServiceRequest(date: date.toRequestFormat(),
                                         operation: type.rawValue,
                                         origin: origin?.rawValue)
        flightsService.getFlights(body) { [weak self] result in
            switch (result) {
            case .success(let response):
//                print(response.flights)
                self?.flights = response.flights
            case .failure(let error):
                print(error)
            }
        }
    }    
}

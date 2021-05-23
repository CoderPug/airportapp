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
        
    private var groupedFlights: [GroupedFlights] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    private var error: Error? {
        didSet {
            self.errorClosure?()
        }
    }
    
    public var reloadTableViewClosure: (() -> Void)?
    public var errorClosure: (() -> Void)?
    public var numberOfSections: Int {
        return groupedFlights.count
    }
        
    init(service: FlightsService) {
        self.groupedFlights = []
        self.flightsService = service
    }
    
    public func numberOfFlights(for section: Int) -> Int {
        guard section >= 0 && section < groupedFlights.count else { return 0 }
        return groupedFlights[section].flights.count
    }
    
    public func getSectionTitle(for index: Int) -> String? {
        guard index >= 0, index < groupedFlights.count else { return nil }
        return groupedFlights[index].date
    }
    
    public func getFlight(for indexPath: IndexPath) -> FlightViewModel? {
        guard indexPath.section < groupedFlights.count,
              indexPath.row < groupedFlights[indexPath.section].flights.count else { return nil }
        let flight = groupedFlights[indexPath.section].flights[indexPath.row]
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
                self?.groupedFlights = response
            case .failure(let error):
                self?.error = error
            }
        }
    }
}

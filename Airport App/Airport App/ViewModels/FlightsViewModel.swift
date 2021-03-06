//
//  FlightsViewModel.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation

public final class FlightsViewModel {
    
    private var flightsService: FlightsService
            
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
        return groupedFlights[index].date.toPresentationFormat()
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
    
    public func getFlightsPresentationTypes() -> [String] {
        return FlightPresentationType.allCases.map { $0.value() }
    }
    
    public func presentationTypeSelected(_ index: Int) {
        guard index >= 0, index < FlightPresentationType.allCases.count else { return }
        let type = FlightPresentationType.allCases[index]
        switch type {
        case .internationalArrival:
            loadInternationalArrival()
        case .internationalDeparture:
            loadInternationalDeparture()
        case .nationalArrival:
            loadNationalArrival()
        case .nationalDeparture:
            loadNationalDeparture()
        }
    }
    
    public func getTopHeaderImageName(_ index: Int) -> String? {
        guard index >= 0, index < FlightPresentationType.allCases.count else { return nil }
        let type = FlightPresentationType.allCases[index]
        switch type {
        case .internationalArrival, .nationalArrival:
            return "arrival-icon"
        case .internationalDeparture, .nationalDeparture:
            return "departure-icon"
        }
    }
    
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
//        date.toRequestFormat()
        let body = FlightsServiceRequest(date: nil,
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

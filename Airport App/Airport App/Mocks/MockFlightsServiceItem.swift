//
//  MockFlightsServiceItem.swift
//  Airport App
//
//  Created by Jose Torres on 5/17/21.
//

import Foundation

private extension FlightsServiceResponse {
    
    static func empty() -> [GroupedFlights] {
        return []
    }
    
    static func singleElement() -> [GroupedFlights] {
        let file: MockFile = "flightsResponseSingleElement"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func multipleElements() -> [GroupedFlights] {
        let file: MockFile = "flightsResponseMultipleElements"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func internationalArrivals() -> [GroupedFlights] {
        let file: MockFile = "flightsResponseInternationalArrivals"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func internationalDepartures() -> [GroupedFlights] {
        let file: MockFile = "flightsResponseInternationalDepartures"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func nationalArrivals() -> [GroupedFlights] {
        let file: MockFile = "flightsResponseNationalArrivals"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func nationalDepartures() -> [GroupedFlights] {
        let file: MockFile = "flightsResponseNationalDepartures"
        return FlightsServiceResponse.data(from: file)
    }
    
    private static func data(from mockFile: MockFile) -> [GroupedFlights] {
        let response: FlightsServiceResponse? = mockFile.customLoad()
        let dictionary = Dictionary(grouping: response?.flights ?? []) { $0.scheduledDate }
        let groupedFlights = dictionary.compactMap{ GroupedFlights(date: $0.key, flights: $0.value) }
        return groupedFlights
    }
    
}

public final class MockFlightsServiceItem: FlightsService {
    
    enum MockType {
        
        case empty
        case single
        case multiple
        case internationalArrival
        case internationalDeparture
        case nationalArrival
        case nationalDeparture
        
        func file() -> [GroupedFlights] {
            switch self{
            case .empty:
                return FlightsServiceResponse.empty()
            case .single:
                return FlightsServiceResponse.singleElement()
            case .multiple:
                return FlightsServiceResponse.multipleElements()
            case .internationalArrival:
                return FlightsServiceResponse.internationalArrivals()
            case .internationalDeparture:
                return FlightsServiceResponse.internationalDepartures()
            case .nationalArrival:
                return FlightsServiceResponse.nationalArrivals()
            case .nationalDeparture:
                return FlightsServiceResponse.nationalDepartures()
            }
        }
    }
    
    let type: MockType
    
    init(type: MockType) {
        self.type = type
    }
        
    func getFlights(_ request: FlightsServiceRequest,
                    completionHandler: @escaping (Result<[GroupedFlights], Error>) -> Void) {

        completionHandler(Result.success(type.file()))
    }
}

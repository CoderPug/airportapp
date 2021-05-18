//
//  MockFlightsServiceItem.swift
//  Airport App
//
//  Created by Jose Torres on 5/17/21.
//

import Foundation

private extension FlightsServiceResponse {
    
    static func empty() -> FlightsServiceResponse {
        return FlightsServiceResponse(flights: [])
    }
    
    static func singleElement() -> FlightsServiceResponse {
        let file: MockFile = "flightsResponseSingleElement"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func multipleElements() -> FlightsServiceResponse {
        let file: MockFile = "flightsResponseMultipleElements"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func internationalArrivals() -> FlightsServiceResponse {
        let file: MockFile = "flightsResponseInternationalArrivals"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func internationalDepartures() -> FlightsServiceResponse {
        let file: MockFile = "flightsResponseInternationalDepartures"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func nationalArrivals() -> FlightsServiceResponse {
        let file: MockFile = "flightsResponseNationalArrivals"
        return FlightsServiceResponse.data(from: file)
    }
    
    static func nationalDepartures() -> FlightsServiceResponse {
        let file: MockFile = "flightsResponseNationalDepartures"
        return FlightsServiceResponse.data(from: file)
    }
    
    private static func data(from mockFile: MockFile) -> FlightsServiceResponse {
        let flights: FlightsServiceResponse? = mockFile.customLoad()
        return FlightsServiceResponse(flights: flights?.flights ?? [])
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
        
        func file() -> FlightsServiceResponse {
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
                    completionHandler: @escaping (Result<FlightsServiceResponse, Error>) -> Void) {

        completionHandler(Result.success(type.file()))
    }
}

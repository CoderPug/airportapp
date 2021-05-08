//
//  FlightsServiceItem.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation

public final class FlightsServiceItem: FlightsService {
        
    func getFlights(_ request: FlightsServiceRequest,
                    completionHandler: @escaping (Result<FlightsServiceResponse, Error>) -> Void) {

        Client().request(API.Flights.getFlights(body: request)) { (result: Result<FlightsServiceResponse, Error>) in
            completionHandler(result)
        }
    }
}


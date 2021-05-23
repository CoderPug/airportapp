//
//  FlightsServiceItem.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation

public final class FlightsServiceItem: FlightsService {
        
    func getFlights(_ request: FlightsServiceRequest,
                    completionHandler: @escaping (Result<[GroupedFlights], Error>) -> Void) {

        Client().request(API.Flights.getFlights(body: request)) { (result: Result<FlightsServiceResponse, Error>) in
            
            switch result {
            case .success(let response):
                let flights = response.flights
                let dictionary = Dictionary(grouping: flights) { $0.scheduledDate }
                let groupedFlights = dictionary.map{ GroupedFlights(date: $0.key, flights: $0.value) }
                completionHandler(.success(groupedFlights))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}


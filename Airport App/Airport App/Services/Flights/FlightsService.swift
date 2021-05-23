//
//  FlightsService.swift
//  Airport App
//
//  Created by Jose Torres on 4/10/21.
//

import Foundation

protocol FlightsService {
    
    func getFlights(_ request: FlightsServiceRequest,
                    completionHandler: @escaping (Result<[GroupedFlights], Error>) -> Void)
}

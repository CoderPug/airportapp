//
//  API+Flights.swift
//  Airport App
//
//  Created by Jose Torres on 5/8/21.
//

import Foundation

extension API {

    enum Flights {
        static func getFlights(body: FlightsServiceRequest) -> Endpoint<FlightsServiceResponse> {
            let bodyData = try! JSONEncoder().encode(body)
            return Endpoint(method: .post, path: "vuelos/", body: bodyData)
        }
    }
}

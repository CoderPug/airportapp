//
//  ClientProtocol.swift
//  Airport App
//
//  Created by Jose Torres on 4/29/21.
//

import Foundation

public protocol ClientProtocol {
    
    func request<Response: Decodable>(_ endpoint: Endpoint<Response>, completionHandler: @escaping (Result<Response, Error>) -> Void)
}

//
//  Client.swift
//  Airport App
//
//  Created by Jose Torres on 4/29/21.
//

import Foundation

public struct Client {
    
    func url(path: Path) -> URL {
        let domain = URL(string: "https://www.lima-airport.com/_vti_bin/portal/services.svc/")!
        return domain.appendingPathComponent(path)
    }
}

extension Client: ClientProtocol {
    
    public func request<Response: Decodable>(_ endpoint: Endpoint<Response>,
                                  completionHandler: @escaping (Result<Response, Error>) -> Void) {
        
        request(endpoint, acceptableStatusCodes: Array(200..<300), completionHandler: completionHandler)
    }
        
    private func request<Response: Decodable>(_ endpoint: Endpoint<Response>,
                                  acceptableStatusCodes: [Int],
                                  completionHandler: @escaping (Result<Response, Error>) -> Void) {

        let requestURL = url(path: endpoint.path)
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = endpoint.body
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let data = data else {
                completionHandler(.failure(error!))
                return
            }
            let response = try! JSONDecoder().decode(Response.self, from: data)
            print(response)
            completionHandler(.success(response))
        }
        dataTask.resume()
    }
}

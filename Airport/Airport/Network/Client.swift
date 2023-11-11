import Foundation

public struct Client { }

// MARK: - ClientProtocol

extension Client: ClientProtocol {

  public func request<Response: Decodable>(
    _ endpoint: Endpoint<Response>, completionHandler: @escaping (Result<Response, Error>) -> Void
  ) {
    request(endpoint, acceptableStatusCodes: Array(200..<300), completionHandler: completionHandler)
  }

  private func request<Response: Decodable>(
    _ endpoint: Endpoint<Response>,
    acceptableStatusCodes: [Int],
    completionHandler: @escaping (Result<Response, Error>) -> Void
  ) {

    let requestURL = self.url(path: endpoint.path)
    var urlRequest = URLRequest(url: requestURL)
    urlRequest.httpMethod = endpoint.method.rawValue
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.httpBody = endpoint.body

    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard 
        let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode),
        let data = data
      else {
        completionHandler(.failure(error!))
        return
      }
      do {
        let response = try JSONDecoder().decode(Response.self, from: data)
        completionHandler(.success(response))
      } catch {
        completionHandler(.failure(error))
      }
    }
    dataTask.resume()

  }

  private func url(path: Path) -> URL {
    return Server.baseURL.appendingPathComponent(path)
  }

}

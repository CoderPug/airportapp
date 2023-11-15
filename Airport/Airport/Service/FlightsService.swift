final class FlightsService: FlightsServiceProtocol {

  private let client: ClientProtocol

  init(client: ClientProtocol = Client()) {
    self.client = client
  }

  func get(completion: @escaping (Result<FlightsContent, Error>) -> Void) {

    let endpoint = API.Flights.get()
    self.client.request(endpoint) { result in
      switch result {
      case let .success(getFlightsDTO):
        completion(.success(.init(with: getFlightsDTO)))
      case let .failure(error):
        completion(.failure(error))
      }
    }

  }

}

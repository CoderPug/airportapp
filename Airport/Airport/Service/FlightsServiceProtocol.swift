protocol FlightsServiceProtocol {
  func get(completion: @escaping (Result<FlightsContent, Error>) -> Void)
}

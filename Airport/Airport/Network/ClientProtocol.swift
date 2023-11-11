public protocol ClientProtocol {

  func request<Response: Decodable>(
    _ endpoint: Endpoint<Response>, completionHandler: @escaping (Result<Response, Error>) -> Void
  )

}

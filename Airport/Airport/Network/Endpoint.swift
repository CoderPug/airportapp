import Foundation

typealias Path = String

public enum Method: String {
  case get = "GET"
  case post = "POST"
}

public struct Endpoint<Response> {
  let method: Method
  let path: Path
  let body: Data?
}


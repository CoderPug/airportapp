struct ContentFlightsDTO: Codable {
  let domestic: FlightsDataDTO
  let international: FlightsDataDTO
  let all: FlightsDataDTO
}

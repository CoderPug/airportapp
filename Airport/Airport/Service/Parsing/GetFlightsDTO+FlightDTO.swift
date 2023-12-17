extension GetFlightsDTO {

  func getAllFlights(for date: String?) -> [Flight] {
    guard let date, let data = self.data[date] else {
      return []
    }
    return data.arrivals.all.flights
      .flatMap { $0 }
      .compactMap { $0.convertToFlight() }
  }

}

extension FlightsContent {

  init(with getFlightsDTO: GetFlightsDTO) {
    // Get Arrival flights for yesterday, today and tomorrow
    let arrivalsFlightDTO: [FlightDTO] =
    (getFlightsDTO.getDateFlightsDTO(for: .yesterday)?.arrivals.all.flights.flatMap({ $0 })  ?? []) +
      (getFlightsDTO.getDateFlightsDTO(for: .today)?.arrivals.all.flights.flatMap({ $0 }) ?? []) +
      (getFlightsDTO.getDateFlightsDTO(for: .tomorrow)?.arrivals.all.flights.flatMap({ $0 }) ?? [])

    self.arrivals = arrivalsFlightDTO.map(Flight.init(with:))

    // Get Departure flights for yesterday, today and tomorrow
    let departuresFlightDTO: [FlightDTO] =
      (getFlightsDTO.getDateFlightsDTO(for: .yesterday)?.departures.all.flights.flatMap({ $0 })  ?? []) +
      (getFlightsDTO.getDateFlightsDTO(for: .today)?.departures.all.flights.flatMap({ $0 }) ?? []) +
      (getFlightsDTO.getDateFlightsDTO(for: .tomorrow)?.departures.all.flights.flatMap({ $0 }) ?? [])

    self.departures = departuresFlightDTO.map(Flight.init(with:))
  }

}

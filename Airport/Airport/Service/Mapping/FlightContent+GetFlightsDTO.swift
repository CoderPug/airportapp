extension FlightsContent {

  init(with getFlightsDTO: GetFlightsDTO) {
    // Get Arrival flights for yesterday, today and tomorrow
    let yesterdatArrivalFlights = getFlightsDTO.getDateFlightsDTO(for: .yesterday)?.arrivals.all.flights.flatMap({ $0 }) ?? []
    let todayArrivalFlights = getFlightsDTO.getDateFlightsDTO(for: .today)?.arrivals.all.flights.flatMap({ $0 }) ?? []
    let tomorrowArrivalFlights = getFlightsDTO.getDateFlightsDTO(for: .tomorrow)?.arrivals.all.flights.flatMap({ $0 }) ?? []
    self.arrivals = [
      .init(title: "Ayer", flights: yesterdatArrivalFlights.map(Flight.init(with:))),
      .init(title: "Hoy", flights: todayArrivalFlights.map(Flight.init(with:))),
      .init(title: "Mañana", flights: tomorrowArrivalFlights.map(Flight.init(with:)))
    ]

    // Get Departure flights for yesterday, today and tomorrow
    let yesterdayDepartureFlights = getFlightsDTO.getDateFlightsDTO(for: .yesterday)?.departures.all.flights.flatMap({ $0 }) ?? []
    let todayDepartureFlights = getFlightsDTO.getDateFlightsDTO(for: .today)?.departures.all.flights.flatMap({ $0 }) ?? []
    let tomorrowDepartureFlights = getFlightsDTO.getDateFlightsDTO(for: .tomorrow)?.departures.all.flights.flatMap({ $0 }) ?? []

    self.departures = [
      .init(title: "Ayer", flights: yesterdayDepartureFlights.map(Flight.init(with:))),
      .init(title: "Hoy", flights: todayDepartureFlights.map(Flight.init(with:))),
      .init(title: "Mañana", flights: tomorrowDepartureFlights.map(Flight.init(with:)))
    ]
  }

}

extension FlightsContent {

  init(with getFlightsDTOData: GetFlightsDTO) {

    var flightsDTO: [FlightDTO] = []
    getFlightsDTOData.data.keys.forEach { key in
      flightsDTO.append(contentsOf: getFlightsDTOData.data[key]?.arrivals.all.flights.first ?? [])
    }

    self.flights = flightsDTO.map { data in
      return Flight(
        code: data.code,
        number: data.number,
        airline: .init(
          abreviature: data.airlineAbbreviation,
          name: data.airlineCode
        ),
        operation: data.operation == "S" ? .departure : .arrival,
        traffic: data.trafficType == "N" ? .national : .international,
        state: data.state,
        dateTime: .init(
          scheduled: data.dateTimeScheduled,
          estimated: data.dateTimeEstimated,
          real: data.dateTimeReal
        ),
        destination: data.destination
      )
    }
  }

}

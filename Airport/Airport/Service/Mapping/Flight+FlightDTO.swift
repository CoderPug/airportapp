extension Flight {

  init(with flightDTO: FlightDTO) {
    self.init(
      code: flightDTO.code,
      number: flightDTO.number,
      airline: .init(abreviature: flightDTO.airlineAbbreviation, name: flightDTO.airlineCode),
      operation: (flightDTO.operation == "S") ? .departure : .arrival,
      traffic: (flightDTO.trafficType == "N") ? .national : .international,
      state: .init(from: flightDTO.state),
      dateTime: .init(
        scheduled: flightDTO.dateTimeScheduled,
        estimated: flightDTO.dateTimeReal,
        real: flightDTO.dateTimeReal,
        relative: .today // TODO: Fix this
      ),
      destination: flightDTO.destination
    )
  }

}

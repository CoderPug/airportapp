extension FlightDTO {

  func convertToFlight() -> Flight {
    return .init(
      code: self.code,
      number: self.number,
      airline: .init(
        abreviature: self.airlineAbbreviation,
        name: self.airlineCode
      ),
      operation: self.operation == "S" ? .departure : .arrival,
      traffic: self.trafficType == "N" ? .national : .international,
      state: self.state,
      dateTime: .init(
        scheduled: self.dateTimeScheduled,
        estimated: self.dateTimeEstimated,
        real: self.dateTimeReal
      ),
      destination: self.destination
    )
  }

}

struct FlightsSection {
  let title: String
  let flights: [Flight]
}

struct FlightsContent {
  let arrivals: [FlightsSection]
  let departures: [FlightsSection]
}

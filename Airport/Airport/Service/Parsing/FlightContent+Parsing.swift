import Foundation

extension FlightsContent {

  init(with data: GetFlightsDTO) {
    self.flights = [
      .yesterday: data.getAllFlights(for: Date.getStringDates(for: .yesterday)),
      .today: data.getAllFlights(for: Date.getStringDates(for: .today)),
      .tomorrow: data.getAllFlights(for: Date.getStringDates(for: .tomorrow))
    ]
  }

}

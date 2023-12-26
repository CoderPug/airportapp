import SwiftUI

extension FlightsListView {

  @MainActor public final class FlightsViewModel: ObservableObject {

    private let flightsService: FlightsServiceProtocol
    private var flightsContent: FlightsContent

    @Published var allFlights: [Flight]
    @Published var yesterdayFlights: [Flight]
    @Published var todayFlights: [Flight]
    @Published var tomorrowFlights: [Flight]

//    @Published var availableDays: [Day]

    init(
      flightsService: FlightsServiceProtocol = FlightsService(),
      availableModes: [Day] = [.yesterday, .today, .tomorrow]
    ) {
      self.flightsService = flightsService
      self.flightsContent = .init(flights: [:])
      self.allFlights = []
      self.yesterdayFlights = []
      self.todayFlights = []
      self.tomorrowFlights = []
//      self.availableDays = availableModes
//      self.selectedDay = .today

      self.load()
    }

    // MARK: - Private

    private func load() {
      self.flightsService.get { [weak self] result in
        guard let self else { return }
        switch result {
        case let .success(flightContent):
          DispatchQueue.main.async {
            self.flightsContent = flightContent
            self.yesterdayFlights = flightContent.getYesterdayFlights()
            self.todayFlights = flightContent.getTodayFlights()
            self.tomorrowFlights = flightContent.getTomorrowFlights()
          }

        case let .failure(error):
          print(error)
        }
      }
    }

  }

}

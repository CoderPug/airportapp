import SwiftUI

extension FlightsListView {

  @MainActor public final class FlightsViewModel: ObservableObject {

    private let flightsService: FlightsServiceProtocol
    private var flightsContent: FlightsContent

    @Published var flights: [Flight]
    @Published var availableDays: [Day]
    @Published var selectedDay: Day {
      didSet {
        self.flights = self.flightsContent.flights[selectedDay] ?? []
      }
    }

    init(
      flightsService: FlightsServiceProtocol = FlightsService(),
      availableModes: [Day] = [.yesterday, .today, .tomorrow]
    ) {
      self.flightsService = flightsService
      self.flightsContent = .init(flights: [:])
      self.flights = []
      self.availableDays = availableModes
      self.selectedDay = .today

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
            self.selectedDay = .today
          }

        case let .failure(error):
          print(error)
        }
      }
    }

  }

}

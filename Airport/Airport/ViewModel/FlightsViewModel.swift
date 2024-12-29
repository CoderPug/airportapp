import SwiftUI

extension FlightsListView {

  @MainActor public final class FlightsViewModel: ObservableObject {

    private let flightsService: FlightsServiceProtocol

    @Published var arrivals: [FlightsSection] = []
    @Published var departures: [FlightsSection] = []

    init(flightsService: FlightsServiceProtocol = FlightsService()) {
      self.flightsService = flightsService
      self.load()
    }

  }

}

// MARK: - Private

private extension FlightsListView.FlightsViewModel {

  func load() {
    self.flightsService.get { [weak self] result in
      guard let self else { return }
      switch result {
      case let .success(flightContent):
        DispatchQueue.main.async {
          self.arrivals = flightContent.arrivals
          self.departures = flightContent.departures
        }

      case let .failure(error):
        print(error)
      }
    }
  }

}

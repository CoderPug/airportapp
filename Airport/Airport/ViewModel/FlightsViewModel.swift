import SwiftUI

extension FlightsListView {

  @MainActor public final class FlightsViewModel: ObservableObject {

    private let flightsService: FlightsServiceProtocol

    @Published var flights: [Flight]

    init(
      flightsService: FlightsServiceProtocol = FlightsService()
    ) {
      self.flightsService = flightsService
      self.flights = []

      self.load()
    }

    func load() {

      self.flightsService.get { [weak self] result in
        guard let self else { return }
        switch result {
        case let .success(flightContent):
          DispatchQueue.main.async {
            self.flights = flightContent.flights
          }

        case let .failure(error):
          print(error)
        }
      }

    }

  }

}

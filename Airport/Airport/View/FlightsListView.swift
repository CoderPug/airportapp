import SwiftUI

extension Flight: Identifiable {
  var id: UUID { UUID() }

  func summary() -> String {
    return self.airline.abreviature + ": " + self.code + " (\(self.state))"
  }
}

struct FlightsListView: View {

  @StateObject private var viewModel = FlightsViewModel()

  var body: some View {
    List(self.$viewModel.flights) { $flight in
      Text(flight.summary())
    }
  }

}

#Preview {
  FlightsListView()
}

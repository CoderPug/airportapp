import SwiftUI

@main
struct AirportApp: App {

  init() {
    FlightsService().get()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }

}

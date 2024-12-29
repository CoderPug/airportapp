import SwiftUI

extension Flight: Identifiable {
  var id: UUID { UUID() }

  func summary() -> String {
    return self.airline.abreviature + ": " + self.code + " (\(self.state))"
  }
}

extension FlightsSection: Identifiable {
  var id: UUID { UUID() }
}

struct FlightsListView: View {

  @StateObject internal var viewModel = FlightsViewModel()
  @State private var flightsMode: Int = 0

  init() {

    UISegmentedControl.appearance().setTitleTextAttributes(
      [
        .font : UIFont(name: "Inter 18pt SemiBold", size: 13.0) ?? .systemFont(ofSize: 13.0),
        .foregroundColor : UIColor.white
      ],
      for: .normal
    )
    UISegmentedControl.appearance().setTitleTextAttributes(
      [
        .font : UIFont(name: "Inter 18pt Bold", size: 13.0) ?? .systemFont(ofSize: 13.0),
        .foregroundColor : UIColor(cgColor: Color(hex: 0xFFC530).cgColor!)
      ],
      for: .selected
    )
  }

  var body: some View {
    NavigationView {

      VStack {

        VStack {
          VStack(alignment: .leading) {
            Text("Aeropuerto Internacional Jorge Chávez")
              .font(.custom("Inter 18pt Bold", size: 16.0))
              .foregroundStyle(.white)

            Text("Vuelos")
              .font(.custom("Inter 18pt Bold", size: 36.0))
              .foregroundStyle(.white)
          }
          .frame(width: UIScreen.main.bounds.width - 90, alignment: .leading)

          VStack(alignment: .center, spacing: 15) {
            Picker("", selection: $flightsMode) {
              Text("Salidas").tag(0)
              Text("Llegadas").tag(1)
            }
            .pickerStyle(.segmented)
            .frame(width: 200)
          }
        }
        .frame(width: UIScreen.main.bounds.width)
        .textCase(nil)
        .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))

        ScrollViewReader { proxy in
          List {
            let flightsSections = $flightsMode.wrappedValue == 0 ? viewModel.departures : viewModel.arrivals
            ForEach(flightsSections) { flightSection in
              Section {
                ForEach(flightSection.flights) { flight in
                  flightview(flight)
                }
                .id(0)
                .listRowSeparator(.hidden)
              } header: {
                VStack(alignment: .center, spacing: 15) {
                  Text(flightSection.title)
                    .font(.custom("Inter 18pt SemiBold", size: 13.0))
                    .foregroundStyle(.white)
                    .padding(.init(top: 7, leading: 15, bottom: 7, trailing: 15))
                    .background(Color(hex: 0x000000, opacity: 0.07))
                    .cornerRadius(5)
                }
                .frame(width: UIScreen.main.bounds.width)
                .textCase(nil)
              }
              .headerProminence(.increased)
            }
          }
          .scrollContentBackground(.hidden)
        }
        .padding(.init(top: -5, leading: 0, bottom: 0, trailing: 0))
      }
      .background(Image("header-background"))
      .background(Color(hex: 0xF6DE64))
    }
  }

}

//#Preview {
//  let sampleViewModel = FlightsListView.FlightsViewModel()
//  sampleViewModel.flights = [
//    .init(
//      code: "LA2242",
//      number: "2242",
//      airline: .init(abreviature: "LATAM", name: "LA"),
//      operation: .arrival,
//      traffic: .international,
//      state: "EMBARCANDO",
//      dateTime: .init(scheduled: nil, estimated: nil, real: nil),
//      destination: "LIMA"
//    ),
//    .init(
//      code: "LA2142",
//      number: "2142",
//      airline: .init(abreviature: "LAT", name: "LATAM"),
//      operation: .departure,
//      traffic: .national,
//      state: "DEMORADO",
//      dateTime: .init(scheduled: nil, estimated: nil, real: nil),
//      destination: "JAUJA"
//    )
//  ]
//  return FlightsListView(viewModel: sampleViewModel)
//}

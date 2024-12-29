import SwiftUI

extension Flight: Identifiable {
  var id: UUID { UUID() }

  func summary() -> String {
    return self.airline.abreviature + ": " + self.code + " (\(self.state))"
  }
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
      [.foregroundColor : UIColor(cgColor: Color(hex: 0xFFC530).cgColor!)], for: .selected
    )
  }

  var body: some View {
    NavigationView {
      VStack {
        ScrollViewReader { proxy in
          List {
            Section {
              let flights = $flightsMode.wrappedValue == 0 ? viewModel.departures : viewModel.arrivals
              ForEach(flights) { flight in
                flightview(flight)
              }
              .id(0)
              .listRowSeparator(.hidden)
            } header: {
              Spacer()
              VStack {
                VStack(alignment: .leading) {
                  Text("Aeropuerto Internacional Jorge Chavez")
                    .font(.custom("Inter 18pt Bold", size: 16.0))
                    .foregroundStyle(.white)

                  Text("Vuelos")
                    .font(.custom("Inter 18pt Bold", size: 36.0))
                    .foregroundStyle(.white)
                }
                .frame(width: UIScreen.main.bounds.width - 90, alignment: .leading)
//                .border(.red)

                VStack(alignment: .center, spacing: 15) {

                  Picker("", selection: $flightsMode) {
                     Text("Salidas").tag(0)
                     Text("Llegadas").tag(1)
                   }
                  .pickerStyle(.segmented)
                  .frame(width: 200)

                  Text("21 de Diciembre")
                    .font(.custom("Alata-Regular", size: 14.0))
                    .foregroundStyle(.white)
                    .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .background(Color(hex: 0x000000, opacity: 0.07))
                    .cornerRadius(5)
                }
//                .border(.red)

              }
              .frame(width: UIScreen.main.bounds.width)
              .textCase(nil)
              .padding()
//              .border(.red)

              Spacer()
            }
            .headerProminence(.increased)
          }
          .scrollContentBackground(.hidden)
          .background(Image("header-background"))
          .background(Color(hex: 0xF6DE64))
        }
      }
    }
    .preferredColorScheme(.light)
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

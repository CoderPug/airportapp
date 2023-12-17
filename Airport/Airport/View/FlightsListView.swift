import SwiftUI

extension Flight: Identifiable {
  var id: UUID { UUID() }

  func summary() -> String {
    return self.airline.abreviature + ": " + self.code + " (\(self.state))"
  }
}

struct FlightsListView: View {

  @StateObject internal var viewModel = FlightsViewModel()

  func getStateColor(state: String) -> Color {
    switch state {
    case "PROGRAMADO", "ATERRIZO":
      return Color(red: 87.0/255.0, green: 204.0/255.0, blue: 153.0/255.0)
    case "CONFIRMADO":
      return Color(red: 73.0/255.0, green: 88.0/255.0, blue: 103.0/255.0)
    case "DEMORADO":
      return Color(red: 255.0/255.0, green: 133.0/255.0, blue: 82.0/255.0)
    case "EMBARCANDO":
      return Color(red: 255.0/255.0, green: 200.0/255.0, blue: 87.0/255.0)
    case "ULT LLAMAD":
      return Color(red: 255.0/255.0, green: 200.0/255.0, blue: 87.0/255.0)
    case "FIN EMBARQ":
      return Color(red: 87.0/255.0, green: 204.0/255.0, blue: 153.0/255.0)
    case "CANCELADO":
      return Color(red: 249.0/255.0, green: 65.0/255.0, blue: 68.0/255.0)
    default:
      return Color(red: 73.0/255.0, green: 88.0/255.0, blue: 103.0/255.0)
    }
  }

  var body: some View {
    NavigationView {
      VStack {
        Picker("Day Picker", selection: $viewModel.selectedDay) {
          ForEach($viewModel.availableDays, id: \.self) { $day in
            Text(day.displayText)
          }
        }
        .padding(.all)
        .pickerStyle(.segmented)
        List {
          ForEach($viewModel.flights) { $flight in
            VStack(alignment: .leading) {
              HStack {
                Spacer()
                ZStack(alignment: .top) {
                  UnevenRoundedRectangle(
                    cornerRadii: .init(bottomLeading: 11, bottomTrailing: 11)
                  )
                  .fill(getStateColor(state: flight.state))
                  .frame(width: 140, height: 30)
                  Text(flight.state)
                    .font(.headline)
                    .colorInvert()
                    .padding(.top, 5)
                }
                .padding(.top, -10)
              }
              Text("Flight:")
                .font(.caption)
              Text(flight.code + " - " + flight.airline.abreviature)
                .font(.title2)
                .bold()
              HStack() {
                VStack(alignment: .leading) {
                  Text("From:")
                    .font(.caption)
                  Text(flight.destination)
                }
                Spacer()
                VStack(alignment: .center) {
                  Text("Hour:")
                    .font(.caption)
                  Text(flight.dateTime.scheduled?.toText() ?? "-")
                }
              }
            }
          }
        }
        .navigationTitle("Vuelos")
      }
    }
  }

}

#Preview {
  let sampleViewModel = FlightsListView.FlightsViewModel()
  sampleViewModel.flights = [
    .init(
      code: "LA2242",
      number: "2242",
      airline: .init(abreviature: "LATAM", name: "LA"),
      operation: .arrival,
      traffic: .international,
      state: "EMBARCANDO",
      dateTime: .init(scheduled: nil, estimated: nil, real: nil),
      destination: "LIMA"
    ),
    .init(
      code: "LA2142",
      number: "2142",
      airline: .init(abreviature: "LAT", name: "LATAM"),
      operation: .departure,
      traffic: .national,
      state: "DEMORADO",
      dateTime: .init(scheduled: nil, estimated: nil, real: nil),
      destination: "JAUJA"
    )
  ]
  return FlightsListView(viewModel: sampleViewModel)
}

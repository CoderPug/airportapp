import SwiftUI

func getColor(state: Flight.State) -> Color {
  switch state {
  case .scheduled: return Color(red: 87.0/255.0, green: 204.0/255.0, blue: 153.0/255.0)
  case .landed: return Color(hex: 0x459C41)
  case .confirmed: return Color(red: 73.0/255.0, green: 88.0/255.0, blue: 103.0/255.0)
  case .delayed: return Color(red: 255.0/255.0, green: 133.0/255.0, blue: 82.0/255.0)
  case .boarding: return Color(red: 255.0/255.0, green: 200.0/255.0, blue: 87.0/255.0)
  case .lastCall: return Color(red: 255.0/255.0, green: 200.0/255.0, blue: 87.0/255.0)
  case .boardingEnd: return Color(red: 87.0/255.0, green: 204.0/255.0, blue: 153.0/255.0)
  case .canceled: return Color(hex: 0xFF2D2D)
  default: return Color(red: 73.0/255.0, green: 88.0/255.0, blue: 103.0/255.0)
  }
}

func flightview(_ flight: Flight) -> some View {

  return VStack(spacing: -3) {

    HStack {
      Spacer()
      ZStack(alignment: .top) {
        Text(flight.state.rawValue.uppercased())
          .font(.custom("Alata-Regular", size: 12.0))
          .colorInvert()
          .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 15))
          .background(getColor(state: flight.state))
          .cornerRadius(5)
      }
      .padding(.trailing, -10)
    }

    HStack(alignment: .bottom) {
      VStack(alignment: .leading, spacing: -3) {
        Text("12/12/2024")
          .font(.custom("Alata-Regular", size: 12.0))
          .foregroundColor(.gray)

        Text(flight.dateTime.scheduled?.displayText() ?? "-")
          .font(.custom("Alata-Regular", size: 24.0))
          .bold()
      }
      .frame(width: 70)

      VStack(alignment: .leading, spacing: -3) {
        Text(flight.code + " - " + flight.airline.abreviature)
          .font(.custom("Alata-Regular", size: 16.0))

        Text(flight.destination.capitalized)
          .font(.custom("Alata-Regular", size: 24.0))
          .bold()
      }

      Spacer()
    }

    Spacer()

    HStack(alignment: .bottom) {
      Divider()
        .frame(maxWidth: .infinity, maxHeight: 1)
        .background(Color(hex: 0xF2F2F7))
      }
      .padding(.leading, 75)
      .padding(.trailing, -10)
    }

}

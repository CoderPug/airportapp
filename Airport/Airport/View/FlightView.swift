import SwiftUI

func getColor(state: Flight.State) -> Color {
  switch state {
  case .scheduled: return Color(hex: 0xCACACA)
  case .landed: return Color(hex: 0x459C41)
  case .confirmed: return Color(hex: 0xCACACA)
  case .delayed: return Color(hex: 0xFF9447)
  case .boarding: return Color(hex: 0x459C41)
  case .lastCall: return Color(hex: 0xFFC530)
  case .boardingEnd: return Color(hex: 0x459C41)
  case .canceled: return Color(hex: 0xFF2D2D)
  default: return Color(hex: 0xCACACA)
  }
}

func flightview(_ flight: Flight) -> some View {

  return VStack(spacing: -3) {

    HStack {
      Spacer()
      ZStack(alignment: .top) {
        Text(flight.state.text)
          .font(.custom("Alata-Regular", size: 13.0))
          .colorInvert()
          .padding(.init(top: 7, leading: 15, bottom: 7, trailing: 15))
          .background(getColor(state: flight.state))
          .cornerRadius(5)
      }
      .padding(.trailing, -10)
    }

    HStack(alignment: .bottom) {
      VStack(alignment: .leading, spacing: -3) {
        Text(flight.dateTime.scheduled?.displayDate() ?? "-")
          .font(.custom("Alata-Regular", size: 12.0))
          .foregroundColor(.gray)

        Text(flight.dateTime.scheduled?.displayHour() ?? "-")
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

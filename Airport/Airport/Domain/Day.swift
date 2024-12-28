enum Day: String {

  case yesterday = "yesterday"
  case today = "today"
  case tomorrow = "tomorrow"

  var displayText: String {
    switch self {
    case .yesterday: "Ayer"
    case .today: "Hoy"
    case .tomorrow: "Mañana"
    }
  }

}

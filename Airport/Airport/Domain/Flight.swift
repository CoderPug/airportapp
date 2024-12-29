import Foundation

// MARK: - Flight
struct Flight {
  let code: String
  let number: String
  let airline: Flight.Airline
  let operation: Operation
  let traffic: Flight.Traffic
  let state: Flight.State
  let dateTime: DateTime
  let destination: String
}

// MARK: - Flight.Airline
extension Flight {
  struct Airline {
    let abreviature: String
    let name: String
  }
}

// MARK: - Flight.Operation
extension Flight {
  enum Operation: String {
    case arrival
    case departure
  }
}

// MARK: - Flight.Traffic
extension Flight {
  enum Traffic: String {
    case national
    case international
  }
}

// MARK: - Flight.DateTime
extension Flight {
  struct DateTime {
    enum Relative {
      case today
      case yesterday
      case tomorrow
    }
    let scheduled: Date?
    let estimated: Date?
    let real: Date?
    let relative: Flight.DateTime.Relative
  }
}

// MARK: - Flight.State
extension Flight {
  enum State: String {
    case scheduled
    case landed
    case confirmed
    case delayed
    case boarding
    case lastCall
    case boardingEnd
    case canceled
    case unknown
  }
}

// MARK: - Flight.State init
extension Flight.State {
  init(from string: String) {
    switch string {
      case "PROGRAMADO": self = .scheduled
      case "ATERRIZO": self = .landed
      case "CONFIRMADO": self = .confirmed
      case "DEMORADO": self = .delayed
      case "EMBARCANDO": self = .boarding
      case "ULT LLAMAD": self = .lastCall
      case "FIN EMBARQ": self = .boardingEnd
      case "CANCELADO": self = .canceled
      default: self = .unknown
    }
  }

  var text: String {
    switch self {
      case .scheduled: return "Programado"
      case .landed: return "Aterrizó"
      case .confirmed: return "Confirmado"
      case .delayed: return "Demorado"
      case .boarding: return "Embarcando"
      case .lastCall: return "Última llamada"
      case .boardingEnd: return "Fin de embarque"
      case .canceled: return "Cancelado"
      case .unknown: return "Desconocido"
    }
  }
}

// MARK: - Date
extension Date {

  func displayHour() -> String {
    DateFormatter.displayFormatterHour.string(from: self)
  }

  func displayDate() -> String {
    DateFormatter.displayFormatterDate.string(from: self)
  }

}

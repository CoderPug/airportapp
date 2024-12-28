import Foundation

struct Flight {

  struct Airline {
    let abreviature: String
    let name: String
  }

  enum Operation: String {
    case arrival
    case departure
  }

  enum Traffic: String {
    case national
    case international
  }

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

  let code: String
  let number: String
  let airline: Flight.Airline
  let operation: Operation
  let traffic: Flight.Traffic
  let state: String
  let dateTime: DateTime
  let destination: String
}

extension Date {

  func displayText() -> String {
    DateFormatter.displayFormatter.string(from: self)
  }

}

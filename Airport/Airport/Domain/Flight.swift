import Foundation

struct Flight {

  struct Airline {
    let abreviature: String
    let name: String
  }

  enum Operation {
    case arrival
    case departure
  }

  enum Traffic {
    case national
    case international
  }

  struct DateTime {
    let scheduled: Date?
    let estimated: Date?
    let real: Date?
  }

  let code: String
  let number: String
  let airline: Flight.Airline
  let operation: Operation
  let traffic: Flight.Traffic
  let state: String
  let dateTime: DateTime
}

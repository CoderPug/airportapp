import Foundation

extension Date {

  enum Relative: String {
    case today
    case yesterday
    case tomorrow

    var stringDate: String? {
      switch self {
        case .today:
          return getTodayStringDate()
        case .yesterday:
          return getYesterdayStringDate()
        case .tomorrow:
          return getTomorrowStringDate()
      }
    }
  }

}

// MARK: - Private

private extension Date {

  static func getYesterdayStringDate() -> String? {
    let today = Date()
    guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today) else {
      return nil
    }
    return DateFormatter.requestFormatter.string(from: yesterday)
  }

  static func getTodayStringDate() -> String {
    let date = Date()
    return DateFormatter.requestFormatter.string(from: date)
  }

  static func getTomorrowStringDate() -> String? {
    let today = Date()
    guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today) else {
      return nil
    }
    return DateFormatter.requestFormatter.string(from: tomorrow)
  }

}

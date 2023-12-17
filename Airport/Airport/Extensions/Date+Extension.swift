import Foundation

extension Date {

  enum Relative: String {
    case today
    case yesterday
    case tomorrow
  }

  static func getStringDates(for day: Relative) -> String? {
    switch day {
    case .today:
      return getTodayStringDate()
    case .tomorrow:
      return getTomorrowStringDate()
    case .yesterday:
      return getYesterdayStringDate()
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

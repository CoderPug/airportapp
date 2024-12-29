import Foundation

extension DateFormatter {
  
  /// Custom DateFormatter for "yyyy-MM-dd HH:MM:SS"
  static let custom: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()

  /// Display DateFormatter to "HH:MM"
  static let displayFormatterHour: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()

  /// Display DateFormatter to "dd/MM/yyyy"
  static let displayFormatterDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()

  /// Request DateFormatter for "yyyy-MM-dd"
  static let requestFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()

}

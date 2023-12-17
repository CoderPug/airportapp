import Foundation

extension DateFormatter {
  
  /// Custom DateFormatter for "yyyy-MM-dd HH:MM:SS"
  static let custom: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:MM:SS"
    return formatter
  }()

  /// Display DateFormatter for "yyyy-MM-dd HH:MM"
  static let displayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:MM"
    return formatter
  }()

  /// Request DateFormatter for "yyyy-MM-dd"
  static let requestFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()

}

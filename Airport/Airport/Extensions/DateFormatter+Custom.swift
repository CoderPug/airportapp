import Foundation

extension DateFormatter {
  
  /// Custom DateFormatter for "yyyy-MM-dd HH:MM:SS"
  static let custom: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:MM:SS"
    return formatter
  }()

}

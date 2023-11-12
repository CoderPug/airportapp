import Foundation

internal extension KeyedDecodingContainer {

  func decodeCustomDateIfPossible(forKey key: KeyedDecodingContainer<K>.Key) throws -> Date? {
    guard let dateStringValue = try self.decodeIfPresent(String.self, forKey: key) else {
      throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Date does not match expected format")
    }
    return DateFormatter.custom.date(from: dateStringValue)
  }

}

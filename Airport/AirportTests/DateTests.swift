import XCTest

@testable import Airport

private enum Constants {
  static let flightJSON = """
    {
      "date": "2023-12-17 00:00:00"
    }
  """
  static let expectedDate = DateFormatter.custom.date(from: "2023-12-17 00:00:00")
}

/// Sample Element using the custom KeyedDecodingContainer
private struct SampleElement: Decodable {

  let date: Date?
  let nonExistingDate: Date?

  enum CodingKeys: String, CodingKey {
    case date
    case nonExistingDate
  }

  init(from decoder: Decoder) throws {
    let container = try? decoder.container(keyedBy: CodingKeys.self)
    self.date = try? container?.decodeCustomDateIfPossible(forKey: .date)
    self.nonExistingDate = try? container?.decodeCustomDateIfPossible(forKey: .nonExistingDate)
  }

}

final class DateTests: XCTestCase {

  // system under tests
  private var result: SampleElement!

  // data
  private var data: Data!

  override func setUpWithError() throws {
    try super.setUpWithError()

    self.data = Constants.flightJSON.data(using: .utf8)!
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
  }

}

extension DateTests {

  func test_Date_whenUsingCustomParsing_shouldDecodeSuccessfully() {
    // given

    // when
    self.result = try? JSONDecoder().decode(SampleElement.self, from: self.data)

    // then
    XCTAssertNotNil(result?.date, "Date should not be nil")

    let expectedDate = DateFormatter.custom.date(from: "2023-12-17 00:00:00")
    XCTAssertEqual(result?.date, expectedDate, "Date should be same as expected")

    XCTAssertNil(result?.nonExistingDate, "NonExistingDate should be nil")
  }

}

import Foundation

extension GetFlightsDTO {

  func getDateFlightsDTO(for date: Date.Relative) -> DateFlightsDTO? {
    guard let stringDate = date.stringDate else {
      return nil
    }
    return self.data[stringDate]
  }

}

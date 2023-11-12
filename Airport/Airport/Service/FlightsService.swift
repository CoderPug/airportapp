
public final class FlightsService {

  func get() {

    Client().request(API.Flights.get()) { result in
      switch result {
      case let .success(getFlightsDTO):
        let resultFlights = FlightsContent.init(with: getFlightsDTO)
        print("Success: \(resultFlights.flights.count)")
      case let .failure(error):
        print("Error: \(error)")
      }
    }

  }

}

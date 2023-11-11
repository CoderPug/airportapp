
public final class FlightsService {

  func get() {

    Client().request(API.Flights.get()) { result in
      print(result)
    }

  }

}

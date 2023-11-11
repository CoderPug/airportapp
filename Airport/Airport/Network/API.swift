enum API { }

extension API {

  enum Flights {

    static func get() -> Endpoint<FlightsDTO> {
      return Endpoint(method: .get, path: "bridge/flights", body: nil)
    }

  }

}

extension API {

  enum Flights {

    static func get() -> Endpoint<GetFlightsDTO> {
      return Endpoint(method: .get, path: "bridge/flights", body: nil)
    }

  }

}

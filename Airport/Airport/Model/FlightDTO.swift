import Foundation

struct FlightDTO: Codable {

  let code: String
  let number: String
  let operation: String
  let trafficType: String
  let destination: String
  let state: String
  let airlineCode: String
  let airlineAbbreviation: String
  let dateTimeScheduled: Date?
  let dateTimeEstimated: Date?
  let dateTimeReal: Date?
  let dateTimeLastUpdated: Date?
  let terminalNumber: String?
  let beltNumber: String?
  let frontDeskNumber: String?
  let dateTimeFrontDeskOpen: Date?
  let dateTimeFrontDeskClosed: Date?
  let doorNumber: String?

  private enum CodingKeys: String, CodingKey {
    case code = "cod_vuelo"
    case number = "num_vuelo"
    case operation = "tip_ope"
    case trafficType = "tip_trafico"
    case destination = "dsc_prc_dest"
    case state = "dsc_estado"
    case airlineCode = "cod_aerolinea"
    case airlineAbbreviation = "abr_aerolinea"
    case dateTimeScheduled = "fch_hra_prog"
    case dateTimeEstimated = "fch_hra_est"
    case dateTimeReal = "fch_hra_real"
    case dateTimeLastUpdated = "fch_hra_ult"
    case terminalNumber = "num_term_pasajero"
    case beltNumber = "num_faja"
    case frontDeskNumber = "num_mostrador"
    case dateTimeFrontDeskOpen = "fch_hra_mostrador_ini"
    case dateTimeFrontDeskClosed = "fch_hra_mostrador_fin"
    case doorNumber = "num_puerta"
  }

  init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.code = try container.decode(String.self, forKey: .code)
    self.number = try container.decode(String.self, forKey: .number)
    self.operation = try container.decode(String.self, forKey: .operation)
    self.trafficType = try container.decode(String.self, forKey: .trafficType)
    self.destination = try container.decode(String.self, forKey: .destination)
    self.state = try container.decode(String.self, forKey: .state)
    self.airlineCode = try container.decode(String.self, forKey: .airlineCode)
    self.airlineAbbreviation = try container.decode(String.self, forKey: .airlineAbbreviation)

    self.dateTimeScheduled = try container.decodeCustomDateIfPossible(forKey: .dateTimeScheduled)
    self.dateTimeEstimated = try container.decodeCustomDateIfPossible(forKey: .dateTimeEstimated)
    self.dateTimeReal = try container.decodeCustomDateIfPossible(forKey: .dateTimeReal)
    self.dateTimeLastUpdated = nil // try container.decodeCustomDateIfPossible(forKey: .dateTimeLastUpdated)
    self.terminalNumber = try container.decodeIfPresent(String.self, forKey: .terminalNumber)
    self.beltNumber = try container.decodeIfPresent(String.self, forKey: .beltNumber)
    self.frontDeskNumber = try container.decodeIfPresent(String.self, forKey: .frontDeskNumber)
    self.dateTimeFrontDeskOpen = try container.decodeCustomDateIfPossible(forKey: .dateTimeFrontDeskOpen)
    self.dateTimeFrontDeskClosed = try container.decodeCustomDateIfPossible(forKey: .dateTimeFrontDeskClosed)
    self.doorNumber = try container.decodeIfPresent(String.self, forKey: .doorNumber)
  }

}

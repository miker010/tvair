import Foundation

// MARK: - MeteoBlueLocation
struct MeteoBlueLocation: Codable {
    let query: String
    let iso2: MeteoBlueLocationJSONNull?
    let currentPage, itemsPerPage, pages, count: Int
    let orderBy: String
    let lat, lon: MeteoBlueLocationJSONNull?
    let radius: Int
    let type: String
    let results: [MeteoBlueLocationResult]
}

// MARK: - Result
struct MeteoBlueLocationResult: Codable {
    let name, iso2, country, admin1: String
    let lat, lon: Double
    let asl: Int
    let timezone: String
    let population: Int
    let distance: Double
    let icao, iata: String
    let postcodes: [String]
    let featureClass, featureCode, url: String
    let id: Int
}

// MARK: - Encode/decode helpers

class MeteoBlueLocationJSONNull: Codable, Hashable {

    public static func == (lhs: MeteoBlueLocationJSONNull, rhs: MeteoBlueLocationJSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {}

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(MeteoBlueLocationJSONNull.self,
             DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

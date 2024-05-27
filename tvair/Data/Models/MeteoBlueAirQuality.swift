import Foundation

// MARK: - MeteoBlueAirQuality
struct MeteoBlueAirQuality: Codable {
    let metadata: Metadata
    let units: Units
    let data1H: Data1H
    let dataDay: DataDay

    enum CodingKeys: String, CodingKey {
        case metadata, units
        case data1H = "data_1h"
        case dataDay = "data_day"
    }
}

// MARK: - Data1H
struct Data1H: Codable {
    let time: [String]
    let no2, pm10: [Double?]
    let airqualityindex, pollenGrass, dustConcentration: [Double?]
    let pm25: [Double?]
    let sandstormAlert: [Double]
    let ozone, co: [Double?]
    let pollenOlive, pollenBirch: [Double?]
    let aod550, so2: [Double?]

    enum CodingKeys: String, CodingKey {
        case time, no2, pm10, airqualityindex
        case pollenGrass = "pollen_grass"
        case dustConcentration = "dust_concentration"
        case pm25
        case sandstormAlert = "sandstorm_alert"
        case ozone, co
        case pollenOlive = "pollen_olive"
        case pollenBirch = "pollen_birch"
        case aod550, so2
    }
}

// MARK: - DataDay
struct DataDay: Codable {
    let time: [String]
    let pollenOliveMean, airqualityindexMin, pollenGrassMax, dustConcentrationMean: [Double?]
    let ozoneMean, so2Mean: [Double?]
    let pm25Max, dustConcentrationMin, pollenBirchMin: [Double?]
    let no2Min: [Double?]
    let airqualityindexMean, airqualityindexMax: [Double?]
    let pollenGrassMean: [Double?]
    let so2Max: [Double?]
    let no2Max: [Double?]
    let pollenOliveMax, ozoneMin: [Double?]
    let pm25Min, aod550Min, aod550Max, coMean: [Double?]
    let pm10Mean, no2Mean: [Double?]
    let pollenOliveMin: [Double?]
    let pm10Min: [Double?]
    let pm10Max, so2Min, pollenBirchMean, pollenGrassMin: [Double?]
    let indexto1HvaluesEnd: [Double]
    let ozoneMax, dustConcentrationMax: [Double?]
    let aod550Mean: [Double?]
    let coMax: [Double?]
    let indexto1HvaluesStart, sandstormAlert: [Double]
    let coMin: [Double?]
    let pm25Mean: [Double?]
    let pollenBirchMax: [Double?]

    enum CodingKeys: String, CodingKey {
        case time
        case pollenOliveMean = "pollen_olive_mean"
        case airqualityindexMin = "airqualityindex_min"
        case pollenGrassMax = "pollen_grass_max"
        case dustConcentrationMean = "dust_concentration_mean"
        case ozoneMean = "ozone_mean"
        case so2Mean = "so2_mean"
        case pm25Max = "pm25_max"
        case dustConcentrationMin = "dust_concentration_min"
        case pollenBirchMin = "pollen_birch_min"
        case no2Min = "no2_min"
        case airqualityindexMean = "airqualityindex_mean"
        case airqualityindexMax = "airqualityindex_max"
        case pollenGrassMean = "pollen_grass_mean"
        case so2Max = "so2_max"
        case no2Max = "no2_max"
        case pollenOliveMax = "pollen_olive_max"
        case ozoneMin = "ozone_min"
        case pm25Min = "pm25_min"
        case aod550Min = "aod550_min"
        case aod550Max = "aod550_max"
        case coMean = "co_mean"
        case pm10Mean = "pm10_mean"
        case no2Mean = "no2_mean"
        case pollenOliveMin = "pollen_olive_min"
        case pm10Min = "pm10_min"
        case pm10Max = "pm10_max"
        case so2Min = "so2_min"
        case pollenBirchMean = "pollen_birch_mean"
        case pollenGrassMin = "pollen_grass_min"
        case indexto1HvaluesEnd = "indexto1hvalues_end"
        case ozoneMax = "ozone_max"
        case dustConcentrationMax = "dust_concentration_max"
        case aod550Mean = "aod550_mean"
        case coMax = "co_max"
        case indexto1HvaluesStart = "indexto1hvalues_start"
        case sandstormAlert = "sandstorm_alert"
        case coMin = "co_min"
        case pm25Mean = "pm25_mean"
        case pollenBirchMax = "pollen_birch_max"
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    let modelrunUpdatetimeUTC, name: String
    let height: Double
    let timezoneAbbrevation: String
    let latitude: Double
    let modelrunUTC: String
    let longitude: Double
    let utcTimeoffset: Double
    let generationTimeMS: Double

    enum CodingKeys: String, CodingKey {
        case modelrunUpdatetimeUTC = "modelrun_updatetime_utc"
        case name, height
        case timezoneAbbrevation = "timezone_abbrevation"
        case latitude
        case modelrunUTC = "modelrun_utc"
        case longitude
        case utcTimeoffset = "utc_timeoffset"
        case generationTimeMS = "generation_time_ms"
    }
}

// MARK: - Units
struct Units: Codable {
    let no2, pm10, airqualityindex, pollenGrass: String
    let dustConcentration, pm25, ozone, co: String
    let pollenOlive, pollenBirch, time, so2: String
    let aod550: String

    enum CodingKeys: String, CodingKey {
        case no2, pm10, airqualityindex
        case pollenGrass = "pollen_grass"
        case dustConcentration = "dust_concentration"
        case pm25, ozone, co
        case pollenOlive = "pollen_olive"
        case pollenBirch = "pollen_birch"
        case time, so2, aod550
    }
}


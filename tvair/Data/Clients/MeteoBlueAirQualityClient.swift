import UIKit
import Foundation
import Combine
import Alamofire

class MeteoBlueAirQualityClient: NSObject {
    func fetchAirQualityData(lat: Double, lon: Double, completion: @escaping (Result<MeteoBlueAirQuality, Error>) -> Void) {
       let parameters: Parameters = [
           "lat": lat,
           "lon": lon,
           "apikey": MeteoBlueApiConfiguration.apiKey
       ]

        AF.request(MeteoBlueApiConfiguration.baseUrlAirQuality,
                   parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let airQualityData = try JSONDecoder().decode(MeteoBlueAirQuality.self, from: data)
                    completion(.success(airQualityData))
                } catch {
                    print("Decodering mislukt: \(error)")
                    print("Response data: \(String(data: data, encoding: .utf8) ?? "N/A")")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Netwerkfout: \(error)")
                completion(.failure(error))
            }
        }
   }
}

import UIKit
import Foundation
import Combine
import Alamofire

class MeteoBlueLocationClient: NSObject {
       
    func fetchLocationData(query: String, completion: @escaping (Result<MeteoBlueLocation, Error>) -> Void) {
       let parameters: Parameters = [
           "query": query,
           "apikey": MeteoBlueApiConfiguration.apiKey
       ]

        AF.request(MeteoBlueApiConfiguration.baseLocationUrl,
                   parameters: parameters).responseDecodable(of: MeteoBlueLocation.self) { response in
           switch response.result {
           case .success(let locationData):
               completion(.success(locationData))
           case .failure(let error):
               completion(.failure(error))
           }
       }
   }
}

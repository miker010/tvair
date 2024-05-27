import UIKit

let defaultLongitude: Double =  4.47917
let defaultLatitude: Double = 51.9225
let defaultLocationName: String = "Rotterdam"

class MeteoBlueAirQualityViewModel: ObservableObject {
    @Published var airQualityData: MeteoBlueAirQuality?
    @Published var locationData: MeteoBlueLocation?
    @Published var errorMessage: String?
    @Published var locationName : String = defaultLocationName
    @Published var locationLongitude : Double = defaultLongitude
    @Published var locationLatitude  : Double = defaultLatitude

    private let airQualityClient = MeteoBlueAirQualityClient()
    private let locationClient = MeteoBlueLocationClient()
    private let userDefaults = UserDefaults.standard
    
    init(){
        getStoredValues();
    }
    
    func fetchLocationData(query:String){
        locationClient.fetchLocationData(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.locationData = data
                    self?.errorMessage = nil
                    let firstResult = data.results.first;
                    
                    if (firstResult != nil){
                        self?.locationLongitude = firstResult?.lon ?? defaultLongitude
                        self?.locationLatitude = firstResult?.lat ?? defaultLatitude
                        self?.locationName = firstResult?.name ?? defaultLocationName
                        self?.storeValues()
                    }
                    
                case .failure(let error):
                    self?.airQualityData = nil
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func storeValues(){
        userDefaults.set(self.locationName, 
         forKey: MeteoBlueApiConfiguration.storageLocationNameKey)
        userDefaults.set(self.locationLongitude, 
         forKey: MeteoBlueApiConfiguration.storageLocationLongitudeKey)
        userDefaults.set(self.locationLatitude, 
         forKey: MeteoBlueApiConfiguration.storageLocationLatitudeKey)
    }
    
    func getStoredValues(){
        self.locationName = userDefaults.string(
            forKey: MeteoBlueApiConfiguration.storageLocationNameKey) ?? defaultLocationName
        self.locationLongitude = userDefaults.double(
            forKey: MeteoBlueApiConfiguration.storageLocationLongitudeKey)
        self.locationLatitude = userDefaults.double(
            forKey: MeteoBlueApiConfiguration.storageLocationLatitudeKey)
    }
    
    func fetchAirQualityData(lat: Double, lon: Double) {
        airQualityClient.fetchAirQualityData(lat: lat, lon: lon) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.airQualityData = data
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.airQualityData = nil
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

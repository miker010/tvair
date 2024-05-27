import UIKit

class MeteoBlueApiConfiguration: NSObject {
    static let apiKey = "<your key>"
    
    static let baseUrlAirQuality = "https://my.meteoblue.com/packages/airquality-1h_airquality-day"
    static let baseLocationUrl = "https://www.meteoblue.com/en/server/search/query3"
    static let storageLocationNameKey = "location_name";
    static let storageLocationLatitudeKey = "location_latitude";
    static let storageLocationLongitudeKey = "location_longitude";    
}

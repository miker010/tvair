import Foundation
import SwiftUI

class ColorHelper{
    func colorForAQI(_ aqi: Double?) -> Color {
            guard let aqi = aqi else { return Color.gray }
            switch aqi {
                case 0..<50:
                    return Color.blue
                case 50..<100:
                    return Color.yellow
                case 100..<150:
                    return Color.orange
                default:
                    return Color.red
            }
        }
    
    func colorForPollenBirch(_ pollen: Double?) -> Color {
        guard let pollen = pollen else { return Color.gray }
        switch pollen {
            case 0..<20:
                return Color.blue
            case 20..<50:
                return Color.yellow
            case 50..<100:
                return Color.orange
            default:
                return Color.red
        }
    }
        
    func colorForPollen(_ pollen: Double?) -> Color {
        if (pollen == nil) {return Color.gray}
        switch pollen! {
            case 0..<20:
                return Color.blue
            case 20..<50:
                return Color.yellow
            case 50..<100:
                return Color.orange
            default:
                return Color.red
        }
    }
        
    func colorForPM(_ pm: Double?, type: String) -> Color {
        guard let pm = pm else { return Color.gray }
        switch type {
            case "PM10":
                switch pm {
                case 0..<20:
                    return Color.blue
                case 20..<50:
                    return Color.yellow
                case 50..<100:
                    return Color.orange
                default:
                    return Color.red
                }
            case "PM25":
                switch pm {
                case 0..<12:
                    return Color.blue
                case 12..<35.4:
                    return Color.yellow
                case 35.4..<55.4:
                    return Color.orange
                default:
                    return Color.red
                }
            default:
                return Color.gray
            }
    }
}

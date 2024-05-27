import Foundation

struct DateHelper {
    static func formatDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            return "Ongeldige datum"
        }
        
        let currentDate = Date()
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
       
        let currentComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        let yesterdayComponents = calendar.dateComponents([.year, .month, .day], from: yesterdayDate)
        let formatter = DateFormatter()
        
        if components == currentComponents {
            return "Vandaag"
        } else if components == yesterdayComponents {
            return "Gisteren"
        } else {
            formatter.dateFormat = "d-MM"
            return formatter.string(from: date)
        }
    }
}

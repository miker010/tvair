import SwiftUI

struct AirQualityView: View {
    let defaultColumnWidth = 125.0
    let defaultRowHeaderHeight = 50.0
    let defaultRowHeight = 75.0
    
    @StateObject private var viewModel = MeteoBlueAirQualityViewModel()
    @State private var location: String = ""
    @State private var isEditingLocation: Bool = false
    
    let colorHelper = ColorHelper()
    
    var body: some View {
        ScrollView {
                   VStack(alignment: .leading, spacing: 20) {
                       if let airQualityData = viewModel.airQualityData {
                           Group {
                               HStack {
                                   Text("Locatie:").font(.headline)
                                   
                                   if (!isEditingLocation) {
                                       TvOsButton(action: {
                                           isEditingLocation.toggle()
                                       }) {
                                           Text(viewModel.locationName)
                                       }
                                   }
                                   
                                   if isEditingLocation {
                                       TextField("Voer locatie in", text: $location)
                                           .padding()
                                       TvOsButton(action: {
                                           print("Query= \(location)")
                                           viewModel.locationName = location
                                           viewModel.fetchLocationData(query: viewModel.locationName)
                                           isEditingLocation.toggle()
                                       }) {
                                           Text("Opzoeken")
                                       }
                                   }
                               }
                           }
                           Group {
                               HStack {
                                   Text("Datum").frame(width: 200, height: defaultRowHeaderHeight)
                                   Text("Lucht").frame(width: defaultColumnWidth, height: defaultRowHeaderHeight)
                                   Text("Gras").frame(width: defaultColumnWidth, height: defaultRowHeaderHeight)
                                   Text("Berk").frame(width: defaultColumnWidth, height: defaultRowHeaderHeight)
                                   Text("PM10").frame(width: defaultColumnWidth, height: defaultRowHeaderHeight)
                                   Text("PM2.5").frame(width: defaultColumnWidth, height: defaultRowHeaderHeight)
                               }
                              ForEach(airQualityData.dataDay.time.indices, id: \.self) { index in
                                  let airQualityColor = colorHelper.colorForAQI(airQualityData.dataDay.airqualityindexMean[index])
                                  let grassPollenColor = colorHelper.colorForPollen(airQualityData.dataDay.pollenGrassMean[index])
                                  let birchPollenColor = colorHelper.colorForPollenBirch(airQualityData.dataDay.pollenBirchMean[index]);
                                  let pm10Color = colorHelper.colorForPM(airQualityData.dataDay.pm10Mean[index], type: "PM10");
                                  let pm2_5Color = colorHelper.colorForPM(airQualityData.dataDay.pm25Mean[index], type: "PM25");
                                  HStack {
                                      Text("\(DateHelper.formatDateString(airQualityData.dataDay.time[index]))")
                                     .frame(width: 200.0, height: defaultRowHeight)
                                      
                                      Text("\(airQualityData.dataDay.airqualityindexMean[index]?.description ?? "")")
                                      .frame(width: defaultColumnWidth, height: defaultRowHeight)
                                      .background(airQualityColor)
                                      
                                      Text("\(airQualityData.dataDay.pollenGrassMean[index]?.description ?? "")")
                                      .frame(width: defaultColumnWidth, height: defaultRowHeight)
                                      .background(grassPollenColor)
                                      
                                      Text("\(airQualityData.dataDay.pollenBirchMean[index]?.description ?? "")")
                                      .frame(width: defaultColumnWidth, height: defaultRowHeight)
                                      .background(birchPollenColor)
                                      
                                      Text("\(airQualityData.dataDay.pm10Mean[index]?.description ?? "")")
                                      .frame(width: defaultColumnWidth, height: defaultRowHeight)
                                      .background(pm10Color)
                                      
                                      Text("\(airQualityData.dataDay.pm25Mean[index]?.description ?? "")")
                                      .frame(width: defaultColumnWidth, height: defaultRowHeight)
                                      .background(pm2_5Color)
                                  }
                              }
                           }
                       } else if let errorMessage = viewModel.errorMessage {
                           Text("Error: \(errorMessage)")
                       } else {
                           Text("Loading...")
                       }
                   }
                   .padding()
        }
        .onAppear(){
            fetchData()
        }
        .onReceive(viewModel.$locationName) { newData in
            fetchData()
       }
    }
    
    func fetchData(){
        viewModel.fetchAirQualityData(lat: viewModel.locationLatitude, lon: viewModel.locationLongitude)
    }
   
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView()
    }
}

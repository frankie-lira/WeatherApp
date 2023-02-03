//
//  ContentView.swift
//  Weather
//
//  Created by Francisco Lira on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
        
    var body: some View {
        VStack {
            
            if let location = locationManager.location{ //made an if because location is optional for the use rto share
//                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                
                if let weather = weather{
//                    Text("Weather data fetched!")
                    WeatherView(weather: weather)
                } else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                                print("Error getting weather \(error)")
                                
                            }
                        }
                    
                }
            }
            else{
                if locationManager.isLoading{
                    LoadingView()
                }
                else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .padding()
        .background(Color(hue: 0.679, saturation: 0.966, brightness: 0.381))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

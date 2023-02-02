//
//  ContentView.swift
//  Weather
//
//  Created by Francisco Lira on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{ //made an if because location is optional for the use rto share
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            }
            else{
                if locationManager.isLoading{
                    ProgressView()
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

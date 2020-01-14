//
//  ContentView.swift
//  PlacesOfInterest
//
//  Created by Bruno JOUSSE on 07/01/2020.
//  Copyright © 2020 Bruno JOUSSE. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    
    var body: some View {
        let pIs = MapsPlacesController().getPlaces()
                
        return NavigationView{
            LoadingView(isShowing: .constant(false)) {
            ZStack(alignment: .center){
                MapView(coordinate: CLLocationCoordinate2D(
                latitude: 48.8566969,
                longitude: 2.3514616))
                .edgesIgnoringSafeArea(.top)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                    List(pIs) { row in
                        NavigationLink(destination: PIDetailsView(pI: row)) {
                            PIView(pI: row)
                                .padding(.bottom, 10)
                        }
                    }
                
                .frame(width: (UIScreen.main.bounds.width-50), height: UIScreen.main.bounds.height)
                .offset(y: 600)
            }
                }
        }
    }
}

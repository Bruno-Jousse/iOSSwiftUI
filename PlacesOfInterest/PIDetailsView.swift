//
//  PIDetailsView.swift
//  PlacesOfInterest
//
//  Created by Bruno JOUSSE on 07/01/2020.
//  Copyright © 2020 Bruno JOUSSE. All rights reserved.
//

import SwiftUI
import CoreLocation

struct PIDetailsView: View {
    var pI : PI
    
    var body: some View {
        VStack{
            MapView(coordinate: pI.locationCoordinate)
            .edgesIgnoringSafeArea(.top)
                .frame(width: UIScreen.main.bounds.width, height: 300)
            Text(pI.name)
            //Text(pI.plus_code.first!.compound_code)
            Text(pI.types[0])
            pI.image()
        }
    }
}

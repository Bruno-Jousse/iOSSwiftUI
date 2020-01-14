//
//  PIView.swift
//  PlacesOfInterest
//
//  Created by Bruno JOUSSE on 07/01/2020.
//  Copyright © 2020 Bruno JOUSSE. All rights reserved.
//

import SwiftUI

struct PIView: View {
    var pI: PI
    var body: some View {
        HStack{
            pI.image()
                .resizable()
                //.frame(width: 60, height: 60)
            VStack{
                Text(pI.name)
                //Text(pI.plus_code.first!.compound_code)
            }
        }
    }
}

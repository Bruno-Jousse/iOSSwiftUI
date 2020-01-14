//
//  MapsPlacesController.swift
//  PlacesOfInterest
//
//  Created by Bruno JOUSSE on 14/01/2020.
//  Copyright © 2020 Bruno JOUSSE. All rights reserved.
//

import Foundation
import GooglePlaces
import SwiftUI

class MapsPlacesController{
    
    func getPlaces() -> [PI]{
        var placesClient = GMSPlacesClient()
        var coordinate = CLLocationCoordinate2D()
        
        placesClient = GMSPlacesClient.shared()
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
        if let error = error {
          print("Current Place error: \(error.localizedDescription)")
          return
        }

        if let placeLikelihoodList = placeLikelihoodList {
          let place = placeLikelihoodList.likelihoods.first?.place
          if let place = place {
            coordinate = place.coordinate
          }
        }
      })
        
        let jsonPlaces = getNearbyPlaces(coordinate: coordinate)
        return jsonPlaces.results
    }
    
    private func getNearbyPlaces(coordinate: CLLocationCoordinate2D) -> Response{
        let maQuery = String("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + String(coordinate.latitude) + "," + String(coordinate.longitude) + "&radius=1500&type=point_of_interest|tourist_attraction|amusement_park|art_gallery|aquarium|casino|church|city_hall|hindu_temple|zoo|synagogue|shopping_mall|park|night_club|museum|movie_theater|mosque|library&key=AIzaSyACa6m-WRAFLrx48PAlbuSocNAf4VKyDFk")

        var request = URLRequest(url: URL(string: maQuery)!)
        request.httpMethod = "GET"

        var jsonPlaces = Response()
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let jsonDecoder = JSONDecoder()
                jsonPlaces = try jsonDecoder.decode(Response.self, from: data!)
            } catch {
                print("error")
            }
        })

        task.resume()
        
        return jsonPlaces
    }
}

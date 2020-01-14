//
//  PI.swift
//  PlacesOfInterest
//
//  Created by Bruno JOUSSE on 07/01/2020.
//  Copyright © 2020 Bruno JOUSSE. All rights reserved.
//
import SwiftUI
import CoreLocation

struct Response: Codable {
    var results = [PI]()
}

struct Geometry: Codable {
    var location: Location
}

struct Location: Codable {
    var lat: Double
    var lng: Double
}

struct Photo: Codable {
    var photo_reference: String
}

struct PlusCode: Codable{
    var compound_code: String
}

struct PI : Identifiable, Codable{
    
    var id = UUID().uuidString
    var geometry: Geometry
    var name: String?
    var photos: [Photo]
    var plus_code: [PlusCode]
    var types: [String]
    
    var locationCoordinate : CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: geometry.location.lat,
            longitude: geometry.location.lng)
    }
    
    func image() -> Image{
        var request = URLRequest(url: URL(string: photos[0].photo_reference)!)
        request.httpMethod = "GET"

        var image = Image("408-536x354")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            let uiImage = UIImage(data: data!)!
            image = Image(uiImage: uiImage)
        })

        task.resume()
        
        return image
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}


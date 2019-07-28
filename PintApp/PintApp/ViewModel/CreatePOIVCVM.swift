//
//  CreatePOIVCVM.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation


struct CreatePOIVCVM{
    let network : Network
    var collection : POICollection
    var location : (lat: Double, lon : Double)?
    var shortDescription : String
    
    init(collection : POICollection,
         location : (lat: Double, lon : Double)? = nil,
         shortDescription : String = "",
         network : Network = NetworkFirebase()){
        self.collection = collection
        self.location = location
        self.shortDescription = shortDescription
        self.network = network
    }
    
    var canCreatePOI : Bool{
        return location != nil && shortDescription.isEmpty == false
    }
    
    mutating func createNewPOI() -> NetworkError?{
        guard let location = self.location else{
            return NetworkError.invalidData
        }
        let poi = PointOfInterest(id: UUID().uuidString,
                                  latitude: location.lat,
                                  longitude: location.lon,
                                  shortDescription: self.shortDescription)
        
        collection.poi.append(poi)
        
        network.save(collection: collection)
        
        return nil
    }
}

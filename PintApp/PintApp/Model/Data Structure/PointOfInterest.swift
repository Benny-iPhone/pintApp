//
//  POI.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation

struct PointOfInterest{
    let id : String
    let latitude : Double
    let longitude : Double
    let shortDescription : String
    
    var dictionary : [String:Any]{
        return [
            "id":id,
            "latitude":latitude,
            "longitude":longitude,
            "shortDescription":shortDescription
        ]
    }
}

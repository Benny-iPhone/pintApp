//
//  POICollection.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation

struct POICollection{
    
    static var collectionPath : String{
        return "POICollection"
    }
    
    let acl : [String]
    let id : String
    let owner : String
    var poi : [PointOfInterest]
 
    var dictionary : [String:Any]{
        return [
            "acl":acl,
            "id":id,
            "owner":owner,
            "poi":poi.compactMap{ $0.dictionary }
        ]
    }
    
    init(acl : [String] = [],
         owner : String = AppModel.shared.userId!,
         poi : [PointOfInterest] = []){
        
        self.acl = acl
        self.owner = owner
        self.id = UUID().uuidString
        self.poi = poi
        
    }
    
}

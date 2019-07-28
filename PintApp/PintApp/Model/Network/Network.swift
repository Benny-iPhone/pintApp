//
//  Network.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation
/*
struct Meeting{
    
}

enum TimeSlotState{
    case empty
    case occupy(meeting : Meeting)
}*/

enum NetworkError : Error{
    case unknown
    case invalidData
    case connection(error : Error)
    
    var localizedDescription: String{
        switch self {
        case .invalidData: return "Invalid Data"
        case .unknown: return "Unknown Error, Check you connection"
        case .connection(let error):
            return "Connection Error: \(error.localizedDescription)"
        }
    }
}

protocol Network {
    func signUp(with name : String, callback : @escaping (Result<String,NetworkError>)->Void)
    func save(collection : POICollection)
}

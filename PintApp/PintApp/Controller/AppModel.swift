//
//  AppModel.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation
import FirebaseAuth

class AppModel{
    static let shared = AppModel()
    
    var userId : String?{
        return Auth.auth().currentUser?.uid
    }
}


//
//  LoginVCVM.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation

struct LoginVCVM{ //Login View Controller View Model
    var name : String = ""
    let network : Network
    
    init(name : String = "", network : Network = NetworkFirebase()){
        self.name = name
        self.network = network
    }
    
    var isValid : Bool{
        return name.count > 3
    }
    
    func performLogin(with callback : @escaping (NetworkError?)->Void){
        guard isValid else{
            callback(.invalidData)
            return
        }
        
        network.signUp(with: name) { (result) in
            switch result{
            case .failure(let error):
                callback(error)
            case .success(_/*let userId*/):
                callback(nil)
            }
        }
    }
}

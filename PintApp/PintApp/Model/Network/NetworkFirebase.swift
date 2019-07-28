//
//  NetworkFirebase.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation
import FirebaseAuth

struct NetworkFirebase : Network{
    func signUp(with name: String, callback: @escaping (Result<String, NetworkError>) -> Void) {
        
        Auth.auth().signInAnonymously { (authResult, error) in
            
            guard let user = authResult?.user else{
                if let error = error{
                    callback(.failure(.connection(error: error)))
                } else {
                    callback(.failure(.unknown))
                }
                return
            }
            
            let request = user.createProfileChangeRequest()
            request.displayName = name
            
            request.commitChanges(completion: { (_) in
                callback(.success(user.uid))
            })
        }
    }
    
    
}

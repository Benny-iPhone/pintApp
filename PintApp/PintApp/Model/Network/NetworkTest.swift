//
//  NetworkTest.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import Foundation

struct NetworkTest : Network {
    func signUp(with name: String, callback: @escaping (Result<String, NetworkError>) -> Void) {
        callback(.failure(.invalidData))
    }
}


func loginTest(){
    let vm = LoginVCVM(name: "Yan", network: NetworkTest())
    print(vm.isValid == false)
}


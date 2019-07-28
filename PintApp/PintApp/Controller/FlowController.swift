//
//  FlowController.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import UIKit

class FlowController {
    static let shared = FlowController()
    weak var window : UIWindow?
    
    func determineRoot(){
        if AppModel.shared.userId != nil{
            show(storyboard: "Main")
        } else {
            show(storyboard: "Login")
        }
    }
    
    private func show(storyboard name : String){
        
        guard Thread.isMainThread else{
            DispatchQueue.main.async { [weak self] in
                self?.show(storyboard: name)
            }
            return
        }
        
        let storyboard = UIStoryboard(name: name, bundle: .main)
        window?.rootViewController = storyboard.instantiateInitialViewController()
        
    }
}

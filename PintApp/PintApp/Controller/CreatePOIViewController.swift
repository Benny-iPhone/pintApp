//
//  CreatePOIViewController.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import UIKit


class CreatePOIViewController: UIViewController {
    
    var collection : POICollection?
    var vm : CreatePOIVCVM!

    @IBOutlet weak var shortDescriptionTextField: UITextField!
    @IBOutlet weak var locationInfo: UILabel!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collection = self.collection ?? POICollection()
        self.vm = CreatePOIVCVM(collection: collection, location: nil, shortDescription: "")
        refreshButton()
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.mockData()
        }
    }
    
    func mockData(){
        shortDescriptionTextField.text = "Some Short Description"
        vm.location = (32,33)
        
        shortDescriptionEditingChangedAction(shortDescriptionTextField)
        createAction(createButton!)
    }
    
    private func refreshButton(){
        createButton.isEnabled = vm.canCreatePOI
    }
    
    @IBAction func shortDescriptionEditingChangedAction(_ sender : UITextField){
        vm.shortDescription = sender.text ?? ""
        refreshButton()
    }
    
    @IBAction func createAction(_ sender: Any) {
        
        vm.createNewPOI()
        
    }
    

}

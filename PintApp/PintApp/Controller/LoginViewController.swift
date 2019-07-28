//
//  LoginViewController.swift
//  PintApp
//
//  Created by Benny Davidovitz on 28/07/2019.
//  Copyright © 2019 HackerU. All rights reserved.
//

import UIKit
import PKHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var viewModel = LoginVCVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = viewModel.name
        refreshButtonEnabledState()
    }
    
    private func refreshButtonEnabledState(){
        button.isEnabled = viewModel.isValid
    }
    
    
    @IBAction func nameEditingChangedAction(_ sender: Any) {
        refreshButtonEnabledState()
    }
    
    @IBAction func submitAction(_ sender: Any) {
        HUD.show(.progress)
        
        viewModel.performLogin { (error) in
            HUD.hide(animated: true)
            if let error = error{
                HUD.flash(.label(error.localizedDescription))
            } else {
                FlowController.shared.determineRoot()
            }
        }
    }
    

}

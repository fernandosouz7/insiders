//
//  ViewController.swift
//  Insiders
//
//  Created by Guilherme de Sousa Peixoto on 05/07/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
    }


}


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
        setupNavigationController()
        setupLoginButton()
    }
    
    
}

extension LoginViewController {
    
    private func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupLoginButton() {
        loginButton.layer.cornerRadius = 15
    }
}



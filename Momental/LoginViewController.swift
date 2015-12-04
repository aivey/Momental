//
//  LoginViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/14/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = Color.grayColor().CGColor
        emailTextField.textColor = Color.grayColor()
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = Color.grayColor().CGColor
        passwordTextField.textColor = Color.grayColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login(sender: AnyObject) {
        //print("Login automatically")
    }
    
}


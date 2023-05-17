//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Гамзат Гасанов on 16.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    let correctUserName = "User"
    let correctPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    
    
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        showAlert(with: "Forgot User Name ?", and: "Your User Name is \(correctUserName)")
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(with: "Forgot Password ?", and: "Your password is \(correctPassword)")
    }
    
    func performLogin() {
        guard
            userNameTextField.text == correctUserName,
                passwordTextField.text == correctPassword
        else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
            passwordTextField.text = ""
            return
        }
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "LoginSegue",
            let destinationVC = segue.destination as? WelcomeViewController,
            let userName = userNameTextField.text
        else {return}
        
        destinationVC.userName = userName
    }
    
    @IBAction func unwindToLoginViewController(_ unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}


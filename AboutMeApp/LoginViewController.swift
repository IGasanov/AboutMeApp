//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Гамзат Гасанов on 16.05.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    
    private let user = "User"
    private let password = "Password"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.user = user
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                with: "Invalid login or password",
                and: "Please, enter correct login and passsword",
                textField: passwordTextField
            )
            return false
        }
        return true
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
/*        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                with: "Invalid login or password",
                and: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
*/
 }

    
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        showAlert(with: "Forgot User Name ?", and: "Your User Name is \(user)")
    }
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(with: "Forgot Password ?", and: "Your password is \(password)")
    }
 
    
    @IBAction func unwindToLoginViewController(_ unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}


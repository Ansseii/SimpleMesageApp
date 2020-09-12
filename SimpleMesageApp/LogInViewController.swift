//
//  LogInViewController.swift
//  SimpleMesageApp
//
//  Created by Денис on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let user = User(name: "Tim", password: "Apple")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         if segue.identifier == "welcomePage" {
             let tabBarController = segue.destination as! UITabBarController
             let helloVC = tabBarController.viewControllers?.first as! HelloViewController
         }
         */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func logInButtonPressed() {
        guard
            userNameTextField.text == user.name,
            passwordTextField.text == user.password
        else {
            showAlert("Invalid login or password",
                          withMessage: "Please, enter correct login and password",
                          textField: passwordTextField)
                
            return
        }
        performSegue(withIdentifier: "welcomePage", sender: nil)
    }
    
    @IBAction func userOneHintPressed() {
        showAlert("Hello, Bill",
                  withMessage: "Your login: Bill \n Your password: WindowsTop")
    }
    
    @IBAction func userTwoHintPressed() {
        showAlert("Hello, Tim",
                  withMessage: "Your login: Tim \n Your password: JobsForever")
    }
    
    private func showAlert(_ title: String,
                                withMessage message: String,
                                textField: UITextField? = nil) {
           
           let alert = UIAlertController(title: title,
                                         message: message,
                                         preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default) { _ in
               textField?.text = nil
           }
           alert.addAction(okAction)
           present(alert, animated: true)
       }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField.text == userNameTextField.text {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}

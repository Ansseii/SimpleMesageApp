//
//  LogInViewController.swift
//  SimpleMesageApp
//
//  Created by Денис on 13.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //private var user: User!
    
    // MARK: - overrided funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         let tabBarController = segue.destination as! UITabBarController
         let welcomeVC = tabBarController.viewControllers?.first as! HelloViewController
         welcomeVC.profile = user.profile
         */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func logInButtonPressed() {
        if let user = User.auth(login: userNameTextField.text ?? "",
                                password: passwordTextField.text ?? "") {
            
            guard
                userNameTextField.text == user.login,
                passwordTextField.text == user.password
            else {
                showAlert("Invalid login or password",
                            withMessage: "Please, enter correct login and password",
                            textField: passwordTextField)
                return
            }
            performSegue(withIdentifier: "welcomePage", sender: nil)
        } else {
            showAlert("Invalid login or password",
            withMessage: "Please, enter correct login and password",
            textField: passwordTextField)
        }
    }
    
    
    @IBAction func autoLoginAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let tim = User.getUser(by: .tim)
            userNameTextField.text = tim?.login
            passwordTextField.text = tim?.password
        default:
            let bill = User.getUser(by: .bill)
            userNameTextField.text = bill?.login
            passwordTextField.text = bill?.password
        }
    }
    
    
    // MARK: - Private funcs
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

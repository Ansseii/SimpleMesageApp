//
//  MessageViewController.swift
//  SimpleMesageApp
//
//  Created by BEREZIN Stanislav on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit


class MessageViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var inputField: UITextField!
    
    var messages: [Message] = Message.getMessages()
    var profile = Profile(type: .bill, name: "as", surname: "be", avatar: "cd", about: "rt")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        inputField.delegate = self
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func pressSend() {
        guard let textInField = inputField.text else { return }
        if textInField.isEmpty {
            let message = "The field is empty. Please type message"
            showAlert(title: "Attention", message: message)
        } else {
            let message = Message(text: inputField.text ?? "", person: profile)
            Message.setMessage(message: message)
            messages = Message.getMessages()
            inputField.text = ""
            inputField.resignFirstResponder()
            tableView.reloadData()
        }
    }
}

extension MessageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        messages[section].person.fullname
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        let message = messages[indexPath.section]
        cell.textLabel?.text = message.text
        return cell
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension MessageViewController {
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

extension MessageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


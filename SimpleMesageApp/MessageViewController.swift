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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func pressSend(sender: Any?) {
        
    }
}

extension MessageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        return cell
    }
}

//
//  ViewController.swift
//  Simple To Do
//
//  Created by Marwan Alani on 2017-03-04.
//  Copyright © 2017 Marwan Alani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var todoItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To Do List!"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "New Item", message: "Add something to do", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first,
            let nameToSave = textField.text else {
                return
            }
            self.todoItems.append(nameToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = todoItems[indexPath.row]
            return cell
    }
}

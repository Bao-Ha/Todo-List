//
//  ViewController.swift
//  Todo List
//
//  Created by Bao Ha on 5/4/18.
//  Copyright © 2018 Bao Ha. All rights reserved.
//

import UIKit

// Global array, to let its acessable for all
var myIndex = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
    }
    
     //each time the tableView appear its gonna reload the data
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    // TableView Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let todo = todoList {
            return todo.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if let todo = todoList {
            cell.textLabel?.text = todo[indexPath.row]
        }
        return cell
    }
    
    
    // Allow reordering of cells for Edit
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let item = todoList![sourceIndexPath.row]
        todoList?.remove(at: sourceIndexPath.row)
        todoList?.insert(item, at: destinationIndexPath.row)
    }
    
    
    // Edit cells
    @IBAction func edit(_ sender: Any) {
        
        tableView.isEditing = !tableView.isEditing
        
        // Switch word when editing cells
        switch tableView.isEditing {
        case true:
            editButton.title = "Done"
        case false:
            editButton.title = "Edit"
        }
    }
    
    
    // Delete Cell When User Swipe Left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todoList?.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row //the number of myIndex will be equal to the number of row that you are pressing on
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    // UnwindSegue when User Press Cancel or Add 
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    
}


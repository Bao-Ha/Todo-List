//
//  EditTodoController.swift
//  Todo List
//
//  Created by Bao Ha on 22/5/18.
//  Copyright © 2018 Bao Ha. All rights reserved.
//

import UIKit

class EditTodoController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
  
    //Edit mistake when user addTodo and save new to the table in the same row position
    //when is button is click it will remove the old Todo row and add the new one you just edited in
    @IBAction func saveChangesPressed(_ sender: UIButton) {
        if myTextView.text != "" {
            todoList?.remove(at: myIndex)//remove old
            todoList?.insert(myTextView.text, at: myIndex)//add new
        }
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myTextView.text = todoList?[myIndex] // The textView in the HomeworkView viewcontroller is now the homework tableView with correct items
    }

    
    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

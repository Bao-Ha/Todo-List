//
//  AddController.swift
//  Todo List
//
//  Created by Bao Ha on 5/4/18.
//  Copyright © 2018 Bao Ha. All rights reserved.
//

import UIKit

class AddTodoController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
       
        // Add Todo When Something is in textField
        if (textField.text != nil) && textField.text != "" {
            todoList?.append("\(textField.text!)")
            textField.text = ""
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
    }

    
    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

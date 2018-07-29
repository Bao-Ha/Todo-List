//
//  SaveData.swift
//  Todo List
//
//  Created by Bao Ha on 15/5/18.
//  Copyright © 2018 Bao Ha. All rights reserved.
//

import Foundation

var todoList:[String]?

func saveData(todoList:[String]) {
    UserDefaults.standard.setValue(todoList, forKey: "todoList")
}

func fetchData() -> [String]? {
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String] {
        return todo
    }
    else {
        return nil
    }
}

//
//  AddTaskVC.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/1/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  

    @IBOutlet weak var taskTitleField: UITextField!
    @IBOutlet weak var taskCategoryField: UITextField!
    
    // String of Task Categories
    var categories: [String] = ["Math", "Science", "English"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets Up the PickerView For Selecting a Category
        let categoryPicker: UIPickerView = UIPickerView()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        taskCategoryField.inputView = categoryPicker

    }
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        
        // Grabs the Title of Desired Task.
        guard let taskTitle: String = taskTitleField.text else {
            return
        }
        
        // Grabs String of Selected Category
        guard let taskCategoryString: String = taskCategoryField.text else {
            return
        }
        
        // Converts Category String into Category Type
        guard let taskCategory: Category = Category(rawValue: taskCategoryString) else {
            return
        }
        
        // TODO: Add the Task To Previous VC using protocol and delegate
        
        // Clear the Form After Successfully Adding Task
        taskTitleField.text = ""
        taskCategoryField.text = ""
        
    }
    
    // Delegate and Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.taskCategoryField.text = categories[row]
        self.view.endEditing(true)
    }
    
}


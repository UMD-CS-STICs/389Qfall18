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
    
    var categories: [String] = ["Math", "Science", "English"]
    
    var delegate: AddTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryPicker: UIPickerView = UIPickerView()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        taskCategoryField.inputView = categoryPicker

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        
        guard let taskTitle: String = taskTitleField.text else {
            return
        }
        
        guard let taskCategoryString: String = taskCategoryField.text else {
            return
        }
        
        
        NetworkManager.sharedInstance.addTask(taskTitle: taskTitle, taskCategory: taskCategoryString)
        
        /*guard let taskCategory: Category = Category(rawValue: taskCategoryString) else {
            return
        }*/
        
        /*// Add the Task To Previous VC using protocol and delegate
        let newTask: Task = Task(withTitle: taskTitle, withCategory: taskCategory)
        
        delegate?.addTask(newTask: newTask)
        // Reset the Form
        taskTitleField.text = ""
        taskCategoryField.text = ""*/
        
        
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

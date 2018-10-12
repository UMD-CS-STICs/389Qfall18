//
//  ViewController.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/1/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var taskTable: UITableView!
    @IBOutlet weak var taskOverviewView: UIView!
    @IBOutlet weak var numTaskLabel: UILabel!
    
    // Array of Tasks
    var tasks: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the Delegate and DataSource of Tableview
        taskTable.delegate = self
        taskTable.dataSource = self
        
        // Sets up some views
        taskOverviewView.layer.borderWidth = 1
        taskOverviewView.layer.borderColor = UIColor.blue.cgColor
        
        // Creates and adds Test Tasks to the Array
        let task1: Task = Task(withTitle: "Do MATH241 HW", withCategory: .MATH)
        let task2: Task = Task(withTitle: "Study For ENGL393", withCategory: .ENGLISH)
        let task3: Task = Task(withTitle: "Meetup with study group", withCategory: .SCIENCE)
        let task4: Task = Task(withTitle: "Do take-home exam", withCategory: .MATH)
        let task5: Task = Task(withTitle: "Finish Shakespeare Essay", withCategory: .ENGLISH)
        
        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
        tasks.append(task4)
        tasks.append(task5)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Will Update the Number of Tasks Shown When Back From AddTaskVC
        numTaskLabel.text = "\(tasks.count)"
        taskTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Return The Number of Tasks
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Return Back A Task Cell With the Proper Title and Category Marker Color
        
    }

    @IBAction func didTapAddTask(_ sender: UIButton) {
        // ONLY IMPLEMENT IF WORKING ON BONUS
    }
    
    
}


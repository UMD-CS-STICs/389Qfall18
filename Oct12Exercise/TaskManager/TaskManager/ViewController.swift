//
//  ViewController.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/1/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTaskDelegate {
    
    @IBOutlet weak var taskTable: UITableView!
    @IBOutlet weak var taskOverviewView: UIView!
    @IBOutlet weak var numTaskLabel: UILabel!
    
    var task: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskTable.delegate = self
        taskTable.dataSource = self
        
        taskOverviewView.layer.borderWidth = 1
        taskOverviewView.layer.borderColor = UIColor.blue.cgColor
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Gets the latest Tasks And Updates the TableView
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        
        taskCell.taskTitleLbl.text = task[indexPath.row].title
        switch task[indexPath.row].category {
        case .ENGLISH:
            taskCell.categoryMarker.backgroundColor = UIColor.blue
        case .MATH:
            taskCell.categoryMarker.backgroundColor = UIColor.red
        case .SCIENCE:
            taskCell.categoryMarker.backgroundColor = UIColor.green
        }
        
        return taskCell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addTasks") {
            let destVC: AddTaskVC = segue.destination as! AddTaskVC
            destVC.delegate = self
        }
    }

    @IBAction func didTapAddTask(_ sender: UIButton) {
        self.performSegue(withIdentifier: "addTasks", sender: nil)
    }
    
    func addTask(newTask: Task) {
        self.task.append(newTask)
    }
    
}

protocol AddTaskDelegate {
    func addTask(newTask: Task)
}


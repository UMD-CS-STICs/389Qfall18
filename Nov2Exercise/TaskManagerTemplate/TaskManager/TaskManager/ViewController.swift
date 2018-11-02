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
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskTable.delegate = self
        taskTable.dataSource = self
        
        taskOverviewView.layer.borderWidth = 1
        taskOverviewView.layer.borderColor = UIColor.blue.cgColor
        //resetDefaults()
        loadData()
        numTaskLabel.text = "\(tasks.count)"
    }
    
    func loadData() {
        // implement setting tasks from UserDefaults
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Gets the latest Tasks And Updates the TableView
        taskTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        
        taskCell.taskTitleLbl.text = tasks[indexPath.row].title
        switch tasks[indexPath.row].category {
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
    
    func resetDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
    
    func saveTasks() {
        // implement saving tasks to UserDefaults
    }
    
    func addTask(newTask: Task) {
        self.tasks.append(newTask)
        numTaskLabel.text = "\(tasks.count)"
        taskTable.reloadData()
        saveTasks()
    }
    
}

protocol AddTaskDelegate {
    func addTask(newTask: Task)
}

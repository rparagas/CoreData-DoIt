//
//  RootViewController.swift
//  CoreData-DoIt
//
//  Created by Ray Paragas on 7/12/16.
//  Copyright © 2016 Ray Paragas. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if (task.important == true) {
            cell.textLabel?.text = "⭐️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task(name: "Do dishes", important: false)
        let task2 = Task(name: "Pick up Regine", important: true)
        let task3 = Task(name: "Study", important: false)
        return [task1,task2,task3]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        // obtain the index of the selected path for removal later when task is complete
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectSegue", sender: task)
    }
    
}


//
//  TasksViewController.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 7/1/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    fileprivate let cellIdentifier = "TaskCell"
    fileprivate let cellHeight: CGFloat = 60.0
    var tasks = [Task]()
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    @IBOutlet weak var tasksTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItem = addButton
        tasksTableView.tableFooterView = UIView()
        tasksTableView.separatorInset = .zero
        tasksTableView.contentInset = .zero
        tasksTableView.addSubview(refresher)
        tasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        
        handleRefresh()
        
    }
    @objc private func handleAdd() {
        print("Add new item")
        
        let alert = UIAlertController(title: "Add New Task", message: "enter title", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Title"
            $0.textAlignment = .center
        })
        alert.addAction(UIAlertAction(title: "ADD", style: .destructive, handler: { (action) in
            guard let title = alert.textFields?.first?.text?.trimmed, !title.isEmpty else {
                return
            }
            //send new task to server
            self.sendNewTaskToServer(title: title)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func sendNewTaskToServer(title: String) {
        //api code
        
        print("send title to api")
        let newTask = Task(title: title)
        API.newTask(newTask: newTask) { (error: Error?, task: Task?) in
            if let task = task {
                //add it to model
                self.tasks.insert(task, at: 0)
                //insert new row in tableview
                self.tasksTableView.beginUpdates()
                self.tasksTableView.insertRows(at: [IndexPath.init(row:0, section: 0)], with: .automatic)
                self.tasksTableView.endUpdates()
                
                
            }
        }
    }
    
    var isLoading: Bool = false
    var current_page = 1
    var last_page = 1
    
    @objc private func handleRefresh() {
        self.refresher.endRefreshing()
        guard !isLoading else {
            return
        }
        isLoading = true
        API.tasks{ (error: Error?, tasks: [Task]?, last_page: Int) in
            self.isLoading = false
            if let tasks = tasks {
                self.tasks = tasks
                self.tasksTableView.reloadData()
                
                self.current_page = 1
                self.last_page = last_page
            }
        }
    }
    
    fileprivate func loadMore() {
        guard !isLoading else {
            return
        }
        guard current_page < last_page else {
            return
        }
        isLoading = true
        
        API.tasks(page: current_page+1){  (error: Error?, tasks: [Task]?, last_page: Int) in
            self.isLoading = false
            if let tasks = tasks {
                self.tasks.append(contentsOf: tasks)
                self.tasksTableView.reloadData()
                
                self.current_page += 1
                self.last_page = last_page
            }
        }
    }
    
    
}


extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].task
        
        return cell
    }
}

extension TasksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = self.tasks.count
        
        if indexPath.row == count-1 {
            //last row
            self.loadMore()
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let task = tasks[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action: UITableViewRowAction, indexPath: IndexPath) in
            self.handleDelete(task: task, indexPath: indexPath)
        }
        deleteAction.backgroundColor = .red
        
        let editAction = UITableViewRowAction(style: .default, title: "Delete") { (action: UITableViewRowAction, indexPath: IndexPath) in
            self.handleEdit(task: task, indexPath: indexPath)
        }
        editAction.backgroundColor = .lightGray
        return [deleteAction, editAction]
    }
    
    private func handleDelete(task: Task, indexPath: IndexPath) {
        
    }
    
    private func handleEdit(task: Task, indexPath: IndexPath) {
        
    }
}











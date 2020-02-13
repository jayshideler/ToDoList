//
//  ToDoDetailsViewController.swift
//  ToDoList
//
//  Created by Jay Randall Shideler on 2/11/20.
//  Copyright © 2020 Jay Randall Shideler. All rights reserved.
//

import UIKit

class ToDoDetailsViewController: UIViewController {

    var toDo = ToDo()
    
    @IBOutlet weak var reminderLabel: UILabel!
    
    
    @IBAction func doneTap(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo.priority == 1 {
            reminderLabel.text = "❗️" + toDo.name
            
        } else if toDo.priority == 2 {
            reminderLabel.text = "‼️" + toDo.name }
        else{
            reminderLabel.text = toDo.name
            
        }


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

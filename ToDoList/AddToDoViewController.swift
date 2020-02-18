//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Jay Randall Shideler on 2/11/20.
//  Copyright © 2020 Jay Randall Shideler. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var toDoTableViewController: ToDoListTableViewController? = nil
    var pickerController = UIImagePickerController()

    @IBOutlet weak var reminderField: UITextField!
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
                imageView.image = image
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    @IBAction func mediaFolderTapped(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController,animated: true,completion: nil)
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController,animated: true,completion: nil)
    }
    

    @IBAction func addTapped(_ sender: Any) {
        /*before coredata
        let newToDo = ToDo()
        newToDo.priority = prioritySegmentedControl.selectedSegmentIndex
        if let name = reminderField.text {
            newToDo.name = name
        }
        toDoTableViewController?.toDos.append(newToDo)
        toDoTableViewController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        */
        
        /*
        To save data, we must have access to the core data stack. We do so via the NSPersistentContainer and NSManagedObjectContext. NSPersistentContainer contains the core data stack and NSManagedObjectContext acts like a doorway to allow users to save/fetch data from the core data stack. AppDelegate.swift contains Core Data related methods and properties pre-defined when we first create our project.

            Lim, Greg. Beginning iOS 13 & Swift App Development: Develop iOS Apps with Xcode 11, Swift 5, Core ML, ARKit and more . Kindle Edition.
         */
       
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext    {
            let newToDo = ToDoCD (context: context)
            //notice cast to Int32 cause we created the entity with that type
            newToDo.priority = Int32(prioritySegmentedControl.selectedSegmentIndex)
            if let name = reminderField.text {
                    newToDo.name = name
            }
            newToDo.image = imageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    



    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self;
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

//
//  editVC.swift
//  HitList
//
//  Created by Appinventiv on 27/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit
import CoreData

class EditVC: UIViewController {
  
    // MARK: @IBOutlet

    @IBOutlet weak var tableViewOutlet: UITableView!
  
    // PROPERTY
  
    let userData : [String] = ["UserName","Name","Phone","D.O.B","Email","Gender","Password","Address"]
    var selectedUser : User!
    var data : [User] = []
    let dbHelper = DBhelper()
  

    let userScene = UserVC()
    var userno : Int!
  
    // LIFE CYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      tableViewOutlet.dataSource = self
      tableViewOutlet.delegate = self
      
      
      let listNib = UINib(nibName: "TableViewCell", bundle: nil)
      tableViewOutlet.register(listNib, forCellReuseIdentifier: "TableViewCellID")
      
      tableViewOutlet.reloadData()
      // Do any additional setup after loading the view.
    }
  override func viewWillAppear(_ animated: Bool) {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
    
    do {
      
      data = try managedContext.fetch(fetchRequest)
      
    } catch let error as NSError {
      
      print("Could not fetch. \(error), \(error.userInfo)")
      
      tableViewOutlet.reloadData()
  }
}
  
  // MARK :  @IBAction
    
    @IBAction func doneBTAction(_ sender: UIBarButtonItem) {
      
      tableViewOutlet.endEditing(true)
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      
      let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
      
      do {
        
        data = try managedContext.fetch(fetchRequest)
        
      } catch let error as NSError {
        
        print("Could not fetch. \(error), \(error.userInfo)")}
        
         data[userno].userName = selectedUser.userName
        data[userno].name =  selectedUser.name
        data[userno].dob =  selectedUser.dob
        data[userno].email =  selectedUser.email
        data[userno].gender =  selectedUser.gender
        data[userno].password =  selectedUser.password
        data[userno].address =  selectedUser.address
        
        do{
        
          try managedContext.save()
        
          print("saved")
        
        }catch let error as NSError {
          
          print("Could not save \(error)")
      }
  
      _ = self.navigationController?.popViewController(animated: true)

  }
  

}

// MARK : extension EditVC: UITableViewDataSource , UITableViewDelegate

extension EditVC: UITableViewDataSource , UITableViewDelegate  {
  
  // METHOD OF UITableViewDataSource
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
    cell.labelName.text = userData[indexPath.row]
    cell.labelName.text = userData[indexPath.row]
    cell.textFieldInfo.delegate = self
    
    switch  indexPath.row{
      
    case 0:
      cell.textFieldInfo.text = selectedUser.userName
     
    case 1:
      cell.textFieldInfo.text = selectedUser.name
      
    case 2:
      cell.textFieldInfo.text = selectedUser.phone
     
    case 3:
      cell.textFieldInfo.text = selectedUser.dob
         case 4:
      cell.textFieldInfo.text = selectedUser.email
     
    case 5:
      cell.textFieldInfo.text = selectedUser.gender
         case 6:
      cell.textFieldInfo.text = selectedUser.password
     
    case 7:
      cell.textFieldInfo.text = selectedUser.address
         default:
      print("not found")
    }
    cell.textFieldInfo.delegate = self
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userData.count
  }
  }

  // MARK: extension EditVC: UITextFieldDelegat

extension EditVC: UITextFieldDelegate{
  
  // METHOD OF  UITextFieldDelegat
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    guard  let tableViewCell = textField.getTableViewCell as? TableViewCell else { return }
    let tableCellIndexPath = tableViewOutlet.indexPath(for: tableViewCell)
    
    switch tableCellIndexPath!.item {
      
    case 0:
      selectedUser.userName = textField.text
    case 1:
    selectedUser.name = textField.text
    case 2:
     selectedUser.phone = textField.text
    case 3:
       selectedUser.dob = textField.text
    case 4:
       selectedUser.email = textField.text
    case 5:
       selectedUser.gender = textField.text
    case 6:
       selectedUser.password = textField.text
    case 7:
       selectedUser.address = textField.text
      
    default:
      print("not found")
    }
    tableViewOutlet.reloadData()
    
  }
}


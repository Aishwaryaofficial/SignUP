//
//  UserVC.swift
//  HitList
//
//  Created by Appinventiv on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit
import CoreData

class UserVC: UIViewController{

    // MARK : @IBOutlet
  
    @IBOutlet var tableViewOutlet: UITableView!
    @IBOutlet weak var doneBTOutlet: UIBarButtonItem!
  
  
    // MARK: PROPERTY
  
    let userData : [String] =  ["UserName","Name","Phone","D.O.B","Email","Gender","Password","Address"]
		var data : [User] = []
    var username : String?
    var name : String?
    var phon : String?
    var dob  : String?
    var email : String?
    var gender : String?
    var password : String?
    var address : String?
  var selectedUser :User!

    // MARK : TABLE VIEW LIFE CYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
//      self.automaticallyAdjustsScrollViewInsets = false
      
      tableViewOutlet.dataSource = self
      tableViewOutlet.delegate = self
      
      
      let listNib = UINib(nibName: "TableViewCell", bundle: nil)
      tableViewOutlet.register(listNib, forCellReuseIdentifier: "TableViewCellID")
       tableViewOutlet.reloadData()
      
      }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
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
// MARK: @IBAction
  
    @IBAction func doneBTAction(_ sender: UIBarButtonItem) {
      
      tableViewOutlet.endEditing(true)
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      let entity = NSEntityDescription.entity(forEntityName: "User",
                                              in: managedContext)!
      
      let userdata = User(entity: entity,
                          insertInto: managedContext)
      userdata.userName = username
      userdata.name = name
      userdata.phone = phon
      userdata.dob = dob
      userdata.email = email
      userdata.gender = gender
      userdata.password = password
      userdata.address = address
      
      do {
        try managedContext.save()
        data.append(userdata)
        
      } catch let error as NSError {
        
        print("Could not save. \(error), \(error.userInfo)")
      }
      tableViewOutlet.reloadData()
     
      _ = self.navigationController?.popViewController(animated: true)
      
      
         }
  
}

// MARK : extension UserVC: UITableViewDataSource , UITableViewDelegate

extension UserVC: UITableViewDataSource , UITableViewDelegate  {
  
  // METHOD OF UITableViewDataSource
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        cell.labelName.text = userData[indexPath.row]
    cell.textFieldInfo.delegate = self
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userData.count
  }
}

// MARK : extension UserVC: UITextFieldDelegate

extension UserVC: UITextFieldDelegate{
  
  // METHOD OF UITextFieldDelegate
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    guard  let tableViewCell = textField.getTableViewCell as? TableViewCell else { return }
    let tableCellIndexPath = tableViewOutlet.indexPath(for: tableViewCell)
    
    switch tableCellIndexPath!.item {
      
      case 0:
        username = textField.text
      print(username ?? "no value")
      
      case 1:
        name = textField.text
      case 2:
        phon = textField.text
      case 3:
        dob = textField.text
      case 4:
        email = textField.text
      case 5:
        gender = textField.text
      case 6:
        password = textField.text
      case 7:
        address = textField.text
        
      default:
        print("not found")
    }
    tableViewOutlet.reloadData()
    
  }
}

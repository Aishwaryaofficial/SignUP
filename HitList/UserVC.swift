//
//  UserVC.swift
//  HitList
//
//  Created by Appinventiv on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit
import CoreData

class UserVC: UITableViewController {

    // MARK : @IBOutlet
  
    @IBOutlet var tableViewOutlet: UITableView!
    @IBOutlet weak var doneBTOutlet: UIBarButtonItem!
  
  
    // MARK: PROPERTY
  
    let userData : [String] =  ["UserName","Name","Phone","D.O.B","Email","Gender","Password","Address"]
		
    var data : [User] = []

    // MARK : TABLE VIEW LIFE CYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
          
      }
  }
  
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userData.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID" , for: indexPath)  as! TableViewCell
        cell.labelName.text = userData[indexPath.row]
        return cell
    }
  
  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}
   // */
  
  // MARK: @IBAction
    
    @IBAction func doneBTAction(_ sender: Any) {
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      let entity = NSEntityDescription.entity(forEntityName: "user",
                                              in: managedContext)!
      
      let userdata = User(entity: entity,
                          insertInto: managedContext)
      
      // userdata.name = name //setValue(name, forKeyPath: "name")
      
      do {
            try managedContext.save()
            data.append(userdata)
        
          } catch let error as NSError {
        
            print("Could not save. \(error), \(error.userInfo)")
      }

      
      
      
      
    }
    
    
    

}

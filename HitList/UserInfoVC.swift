////
////  UserInfoVCViewController.swift
////  HitList
////
////  Created by Appinventiv on 24/02/17.
////  Copyright © 2017 Razeware. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class UserInfoVC: UIViewController {
//    
//  
//  
//    // MARK: PROPERTY
//  
//    let userData : [String] =  ["UserName","Name","Phone","D.O.B","Email","Gender","Password","Address"]
//		
//    var data : [User] = []
//  
//    // MARK: VIEW LIFE CYCLE
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//      
//      
//
//        // Do any additional setup after loading the view.
//    }
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//      return
//    }
//    
//    let managedContext = appDelegate.persistentContainer.viewContext
//    
//    let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
//    
//    do {
//      
//      data = try managedContext.fetch(fetchRequest)
//      
//    } catch let error as NSError {
//       
//      print("Could not fetch. \(error), \(error.userInfo)")
//      
//    }
//    
//  }
//
//    // MARK: @IBAction
//    
//    @IBAction func doneBTAction(_ sender: UIButton) {
//      
//      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//        return
//      }
//      
//      let managedContext = appDelegate.persistentContainer.viewContext
//      
//      let entity = NSEntityDescription.entity(forEntityName: "user",
//                                              in: managedContext)!
//      
//      let userdata = User(entity: entity,
//                          insertInto: managedContext)
//      
//        //  userdata.name = name //setValue(name, forKeyPath: "name")
//      
//      do {
//          try managedContext.save()
//        
//              data.append(userdata)
//        
//          } catch let error as NSError {
//        
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//     }
//}
//
//extension  UserInfoVC : UITableViewDataSource , UITableViewDelegate {
//  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//    
//  }
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return userData.count
//  }
//  
//}
//    

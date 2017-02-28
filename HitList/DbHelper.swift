//
//  DbHelper.swift
//  HitList
//
//  Created by Appinventiv on 27/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBhelper   {
  
  //MARK: Variables
  //============
  var data = [User]()
  
  var name : String
  
  var dob : String
  
  var email : String
  
  var gender : String
  
  var userName : String
  
  var  address : String
  
  var  password : String
  
  //MARK: Initializers
  //=============
  init() {
    
				name = ""
    
				dob = ""
    
				email = ""
    
				userName = ""
    
				address = ""
    
				password = ""
    
				gender = ""
    

    
    
    
  }
  
  init(withName name : String , withDob dob : String , withEmail email : String ,
       withGender gender : String , withAddress address : String ,
         withPassword password : String , withUserName userName : String) {
    
				self.name = name
    
				self.dob = dob
    
				self.email = email
    
				self.gender = gender
    
        self.userName = userName
    
				self.address = address
    
				self.password = password
    
    
    
    
    
  }
  
}

extension DBhelper {
  
  //MARK: SaveData Method
  //==================
  func saveData() {
    
				guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          
          return
          
    }
    
				let managedContext = appDelegate.persistentContainer.viewContext
    
				let entity = NSEntityDescription.entity(forEntityName: "User" , in: managedContext)!
    
				let user = User(entity: entity , insertInto: managedContext)
    
				user.name = name
    
				user.dob =  dob
    
				user.email = email
    
				user.gender = gender
    
        user.userName = userName
    
				user.address = address
    
				user.password = password

    
				do {
          
          try managedContext.save()
          
          data.append(user)
          
        } catch let error as NSError {
          
          print("Could not save. \(error), \(error.userInfo)")
          
				}
    
  }
  
  //MARK: getData Method
  //==================
  func getData(){
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      
      fatalError("no Delegate !")
      
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
    
    do {
      
      data = try managedContext.fetch(fetchRequest)
      
				}
				catch let error as NSError {
          
          print("Could not fetch. \(error), \(error.userInfo)")
          
				}
    
  }
  
  //MARK: deleteData Method
  //===================
  func deleteData(_ deleteSpecificData : User) {
    
				guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          
          fatalError("no Delegate !")
          
				}
    
				let managedContext = appDelegate.persistentContainer.viewContext
    
				managedContext.delete(deleteSpecificData)
    
				do {
          
          try managedContext.save()
          
        }
        catch _ {
          
				}
    
  }
  
  //MARK: editAtPerson Method
  //=====================
  func editAtPerson(_ atUser : User , _ userIndex : Int) {
    
				guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          
          fatalError("no Delegate !")
          
				}
    
				let managedContext = appDelegate.persistentContainer.viewContext
    
				let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
    
				do {
          
          data = try managedContext.fetch(fetchRequest)
          
        }
        catch let error as NSError {
          
          print("Could not fetch. \(error), \(error.userInfo)")
          
    }
    
				data[userIndex].name = atUser.name
    
				data[userIndex].email = atUser.email
    
				data[userIndex].dob =	atUser.dob
    
				data[userIndex].gender = atUser.gender
    
        data[userIndex].userName = atUser.userName
    
				data[userIndex].address =	atUser.address
    
				data[userIndex].password = atUser.password

    do{
          
          try managedContext.save()
          
          print("saved")
          
        }catch let error as NSError {
          
          print("Could not save \(error)")
          
				}
    
  }
  
}

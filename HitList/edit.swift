////
////  edit.swift
////  HitList
////
////  Created by Appinventiv on 27/02/17.
////  Copyright © 2017 Razeware. All rights reserved.
////
//
//import Foundation
//guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//  
//  fatalError("no Delegate !")
//  
//}
//
//let managedContext = appDelegate.persistentContainer.viewContext
//
//let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
//
//do {
//  
//  people = try managedContext.fetch(fetchRequest)
//  
//}
//catch let error as NSError {
//  
//  print("Could not fetch. \(error), \(error.userInfo)")
//		
//}
//
//people[personIndex].name = atPerson.name
//
//people[personIndex].email = atPerson.email
//
//people[personIndex].age =	atPerson.age
//
//people[personIndex].gender = atPerson.gender
//
//do{
//  
//  try managedContext.save()
//  
//  print("saved")
//  
//}catch let error as NSError {
//  
//  print("Could not save \(error)")
//  
//}
//

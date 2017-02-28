//
//  ShowInfoViewController.swift
//  HitList
//
//  Created by Appinventiv on 25/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class ShowInfoVC: UIViewController {
  
  // MARK: @IBOutlet
  
    @IBOutlet weak var tableViewOutlet: UITableView!
  let userData : [String] =  ["UserName","Name","Phone","D.O.B","Email","Gender","Password","Address"]
  let userScene = UserVC()
  var selectUser : User!
  let mainScene = MainVC()

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
}

    // MARK : extension ShowInfoVC : UITableViewDataSource,UITableViewDelegate

extension ShowInfoVC : UITableViewDataSource,UITableViewDelegate{
  
  // METHOD OF UITableViewDataSource
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
    
    cell.labelName.text = userData[indexPath.row]
    
    switch  indexPath.row{
  
        case 0:
          cell.textFieldInfo.text = selectUser.userName
        case 1:
          cell.textFieldInfo.text = selectUser.name
        case 2:
          cell.textFieldInfo.text = selectUser.phone
        case 3:
          cell.textFieldInfo.text = selectUser.dob
        case 4:
          cell.textFieldInfo.text = selectUser.email
        case 5:
          cell.textFieldInfo.text = selectUser.gender
        case 6:
          cell.textFieldInfo.text = selectUser.password
        case 7:
          cell.textFieldInfo.text = selectUser.address
        default:
          print("not found")
    }
    cell.textFieldInfo.isEnabled = false
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userData.count
  }
  
}

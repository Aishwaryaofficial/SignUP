

import UIKit
import CoreData

@available(iOS 10.0, *)
class MainVC: UIViewController {
  
    // MARK: @IBOutlet

    @IBOutlet weak var tableViewOutlet: UITableView!
  
    // PROPERTY 
  
    var userScene = UserVC()
    var selectUser : User!
 
  
  
    // MARK: TABLE VIEW LIFE CYCLE
  
    override func viewDidLoad() {
      super.viewDidLoad()
    
    
      tableViewOutlet.dataSource = self
      tableViewOutlet.delegate = self
    
      let listNib = UINib(nibName: "UserNameCell", bundle: nil)
      tableViewOutlet.register(listNib, forCellReuseIdentifier: "UserNameCellID")
    
    }
  
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
    
      let managedContext = appDelegate.persistentContainer.viewContext
    
      let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
    
      do {
      
        userScene.data = try managedContext.fetch(fetchRequest)
      
      } catch let error as NSError {
      
        print("Could not fetch. \(error), \(error.userInfo)")
      
      }
    tableViewOutlet.reloadData()
  }

  @IBAction func addName(_ sender: UIBarButtonItem) {
    
     let secondPage = self.storyboard?.instantiateViewController(withIdentifier: "UserSID") as! UserVC
    self.navigationController?.pushViewController(secondPage, animated: true)
  }

}

// MARK: - extension UITableViewDataSource,UITableViewDelegate

extension MainVC: UITableViewDataSource , UITableViewDelegate{
  
      // METHODS OF UITableViewDataSource , UITableViewDelegate

    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return userScene.data.count
    }

  func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell =  tableView.dequeueReusableCell(withIdentifier: "UserNameCellID", for: indexPath) as! UserNameCell
       cell.labelOutlet.text = userScene.data[indexPath.row].name
    
    return cell
 
  }
  
  // when table cell get selected 
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let secondPage = self.storyboard?.instantiateViewController(withIdentifier: "ShowInfoSID") as! ShowInfoVC
      secondPage.selectUser = userScene.data[indexPath.row]
      self.navigationController?.pushViewController(secondPage, animated: true)
  }
  
  
  // edit and delete button working
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
   
    let edit = UITableViewRowAction(style: .normal,title: "Edit",handler: {(action: UITableViewRowAction,index: IndexPath) -> Void in
                                      
        guard let userDetailPage = self.storyboard?.instantiateViewController(withIdentifier: "EditSID") as? EditVC else { return }
        userDetailPage.selectedUser = self.userScene.data[indexPath.row]
        userDetailPage.userno = indexPath.row
        self.navigationController?.pushViewController(userDetailPage, animated: true)
    })
    
    
    let delete = UITableViewRowAction(style: .normal, title: "Delete", handler: {(action : UITableViewRowAction, index : IndexPath) -> Void  in
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      let user = self.userScene.data[indexPath.row]
      self.userScene.data.remove(at: indexPath.row)
      managedContext.delete(user)
      
      do {
        
        try managedContext.save()
        
      } catch let error as NSError {
        
        print("Could not save. \(error), \(error.userInfo)")
        
        }
      
      self.tableViewOutlet.reloadData()
    })
    return [edit,delete]
  }
  
}

//
//  ViewController.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 09/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

class ContactViewController : UIViewController {

    var arrData = [ContactListModel]()
    @IBOutlet var tableview : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationBarButton()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableview.tableFooterView = UIView()
       getContactListFromServer()
    }
    
    
    func navigationBarButton() {
        let logoutBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(handleAddBtn))
        let backImg: UIImage = UIImage(named: ImageName.home_add)!
        logoutBarButtonItem.setBackgroundImage(backImg, for: .normal, barMetrics: .default)
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }

    @objc func handleAddBtn()  {
        
        
        
        guard let myVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.addEditViewController) else { return }
        let navController = UINavigationController(rootViewController: myVC)
        self.navigationController?.present(navController, animated: true, completion: nil)
        
    }
    
  // Mark :  Parse Data From Server
    func getContactListFromServer(){
       MBProgressHUD.showAdded(to: self.view, animated: true)
        let url = URL(string: Constants.contactUrl)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                if self.arrData.count > 0 {
                    self.arrData.removeAll()
                }
                for arr in json.arrayValue{
                    self.arrData.append(ContactListModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                     MBProgressHUD.hide(for: self.view, animated: true)
                }
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    
    
    
    // Mark : Passing id to description ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableview.indexPathForSelectedRow{
            // let selectedRow = indexPath.row
            let dict = arrData[(indexPath as NSIndexPath).row]
            let detailVC = segue.destination as! ContactDescriptionViewController
            detailVC.userId = dict.idd
            
        }
    }

    
}

// Mark : TableView Delegate and Data source Methods
extension ContactViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.contactCell, for: indexPath) as! ContactCell
        
        cell.nameLbl.text = arrData[indexPath.row].first_name + " " + arrData[indexPath.row].last_name
        cell.photoImgView.sd_setImage(with: URL(string: Constants.baseUrl + arrData[indexPath.row].profile_pic), placeholderImage: UIImage(named: ImageName.placeholder_photo))
        cell.photoImgView.SetImageViewRound()
        if arrData[indexPath.row].favorite{
            cell.favImgView.image = UIImage(named: ImageName.home_favourite)
        }
        
            
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
}


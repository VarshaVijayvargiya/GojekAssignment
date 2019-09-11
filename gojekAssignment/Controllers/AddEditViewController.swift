//
//  AddEditViewController.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 10/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import UIKit
import SDWebImage



class AddEditViewController: UITableViewController,DescriptionViewControllerDelegate {
   
    
    func update(contactDic: ContactDesModel, userid : Int ) {
       contactDetailDic = contactDic
        userId = userid
    }
    
   
    @IBOutlet var userImgView : UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    var contactDetailDic : ContactDesModel?
    @IBOutlet weak var gradientView: UIView!
    
    
    var addOrEdit : Int!
    var userId : Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        
       hideKeyboardWhenTappedAround()
       navigationBarSet()
       tableView.tableFooterView = UIView()
       self.userImgView.SetImageViewRound()
        
        
        if (contactDetailDic != nil) {
        nameTextField.text = contactDetailDic?.first_name
        lastNameTextField.text = contactDetailDic?.last_name
        emailTextField.text = contactDetailDic?.email
        mobileTextField.text = contactDetailDic?.mobileNo
            self.userImgView.sd_setImage(with: URL(string: Constants.baseUrl + contactDetailDic!.profile_pic), placeholderImage: UIImage(named: ImageName.placeholder_photo))
           
            addOrEdit = 2
            
        }
        else {
        
             addOrEdit = 1
        }
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        gradientView.setGradientBackground()
    }
    
 
    // MARK: Actions
    
    @objc func submit(_: UIBarButtonItem!) {

        
        
        if addOrEdit == 1 {
            // Add
            let parameters: [String: Any] = [
                Static.first_name: nameTextField.text ?? "",
                Static.last_name: lastNameTextField.text ?? "",
                Static.emailTag : emailTextField.text ?? "",
                Static.mobileTag : mobileTextField.text ?? "",
                Static.favoriteTag : false
            ]
            ApiCall.addDataOnServer(prameters : parameters, vc: self)
            
        }
        else{
            // Edit
            let parameters: [String: Any] = [
                Static.first_name: nameTextField.text ?? "",
                Static.last_name: lastNameTextField.text ?? "",
                Static.emailTag : emailTextField.text ?? "",
                Static.mobileTag : mobileTextField.text ?? "",
                Static.favoriteTag : contactDetailDic?.favorite ?? false
            ]
            
            ApiCall.editDataOnServer(prameters: parameters, userid: userId, vc: self)
        }
        
    }
    
    
    
     @objc func cancle(_: UIBarButtonItem!) {

        dismiss(animated: true, completion: nil)
    }
    
    func navigationBarSet() {
        self.navigationController?.navigationBar.tintColor = Constants.appColor
        
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: Titles.cancleButtonText, style: .plain, target: self, action: #selector(cancle(_:)))
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Titles.doneButtonText, style: .plain, target: self, action: #selector(submit(_:)))
    }
    
    
   
   

}

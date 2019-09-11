//
//  ContactDescriptionViewController.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 09/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

protocol DescriptionViewControllerDelegate: AnyObject {
    func update(contactDic: ContactDesModel, userid : Int)
}


class ContactDescriptionViewController: UIViewController {

    @IBOutlet var emailLabal : UILabel!
    @IBOutlet var mobileNoLbl : UILabel!
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var userImgView : UIImageView!
    @IBOutlet var favBtn      : UIButton!
    @IBOutlet var gradientView: UIView!
    
    var userId : Int!
    var contactDic : ContactDesModel?
    weak var delegate: DescriptionViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationBarButton()
        getContactDetailFromServer()
        self.userImgView.SetImageViewRound()
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
       gradientView.setGradientBackground()
    }
    
    
    func navigationBarButton() {

        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(handleEditBtn))
    }
    
    @objc func handleEditBtn()  {

        
        guard let myVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.addEditViewController) else { return }
        let navController = UINavigationController(rootViewController: myVC)
        self.delegate = myVC as? DescriptionViewControllerDelegate
        delegate?.update(contactDic: contactDic!, userid: userId)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    
    
    func getContactDetailFromServer(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let URLStr = Constants.contactDetailUrl + String(userId) + ".json"
        let url = URL(string: URLStr)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                self.contactDic = ContactDesModel(json:json)
                let dic = ContactDesModel(json:json)
                 DispatchQueue.main.async {
                     MBProgressHUD.hide(for: self.view, animated: true)
                    self.nameLbl.text = dic.first_name + " " + dic.last_name
                    self.mobileNoLbl.text =   dic.mobileNo
                    self.emailLabal.text = dic.email
                    self.userImgView.sd_setImage(with: URL(string: Constants.baseUrl + dic.profile_pic ), placeholderImage: UIImage(named: ImageName.placeholder_photo))
                self.userImgView.SetImageViewRound()
                
                    if dic.favorite == true {
                        self.favBtn?.setImage(UIImage(named: ImageName.fav_selected), for: .normal)
                    }
                
                }
                
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    
    // Mark : Button Actions
    @IBAction func deleteButtonTappedAction()
    {
        ApiCall.deleteDataFromServer(userid :self.userId, vc : self)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func callButtonTappedAction()
    {
        let url: NSURL = URL(string: "TEL://\(String(describing: self.mobileNoLbl.text))")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func messageButtonTappedAction()
    {
        let sms: String = "sms:\(String(describing: self.mobileNoLbl.text))&body= Hello"
        UIApplication.shared.open(URL.init(string: sms.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func emailButtonTappedAction()
    {
       
        let url: NSURL = URL(string: "mailto:\(String(describing: self.emailLabal.text))")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}

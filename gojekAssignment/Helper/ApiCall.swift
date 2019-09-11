//
//  ApiCall.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 10/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class ApiCall
{
    
    
   class func deleteDataFromServer(userid : Int, vc : UIViewController ) {
       MBProgressHUD.showAdded(to: vc.view, animated: true)
        let URLStr = Constants.deleteContactUrl + String(userid) + ".json"
        let url = URL(string: URLStr)
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let dataTask = session.dataTask(with: request) { data,response,error in
            // 1: Check HTTP Response for successful GET request
            DispatchQueue.main.async {
             MBProgressHUD.hide(for: vc.view, animated: true)
            }
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print(Titles.errMsg)
                    return
            }
            switch (httpResponse.statusCode) {
            case 204:
                do{
                    //print("success response.")
                    DispatchQueue.main.async {
                       
                        vc.view.makeToast(Titles.deleteMsg)
                    }

                }
            case 400:
                break
            default:
                break
            }
        }
        dataTask.resume()
        
    }
    
    
    
    class func addDataOnServer(prameters :[String : Any], vc : UIViewController)
    {
        MBProgressHUD.showAdded(to: vc.view, animated: true)
        let url = URL(string: "http://gojek-contacts-app.herokuapp.com/contacts.json")!
        
        
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: prameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request) { data,response,error in
            // 1: Check HTTP Response for successful GET request
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: vc.view, animated: true)
            }
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print(Titles.errMsg)
                    return
            }
            switch (httpResponse.statusCode) {
            case 201:
                do{
                    print("success response.")
                    DispatchQueue.main.async {
                       vc.view.makeToast(Titles.addMsg)
                        
                    }
                    
                }
            case 400:
                break
            default:
                break
            }
        }
        dataTask.resume()
    }
    
    
    class func editDataOnServer(prameters :[String : Any], userid : Int, vc : UIViewController)
    {
        MBProgressHUD.showAdded(to: vc.view, animated: true)
        let URLStr = Constants.deleteContactUrl + String(userid) + ".json"
        let url = URL(string: URLStr)!
        
        
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "PUT" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: prameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request) { data,response,error in
            // 1: Check HTTP Response for successful GET request
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: vc.view, animated: true)
            }
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print(Titles.errMsg)
                    return
            }
            switch (httpResponse.statusCode) {
            case 200:
                do{
                    //print("success response.")
                    DispatchQueue.main.async {
                        
                        vc.view.makeToast(Titles.editMsg)
                    }
                    
                }
            case 400:
                break
            default:
                break
            }
        }
        dataTask.resume()
    }
    
}

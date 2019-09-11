//
//  Constants.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 09/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//


import UIKit

    
    struct Constants {
    
        
        static let appColor = UIColor(red: 80.0/255.0, green: 227.0/255.0, blue: 194.0/255.0, alpha: 1)
        // 50E3C2
        static let baseUrl = "http://gojek-contacts-app.herokuapp.com"
        static let contactUrl = Constants.baseUrl + "/contacts.json"
        static let contactDetailUrl = Constants.baseUrl + "/contacts/"
        static let deleteContactUrl =  Constants.contactDetailUrl
        
      
}

// Mark : Identifier
struct Identifier {
    
    static let tableViewCell = "cell"
    static let contactCell = "ContactCell"
    static let addEditViewController = "AddEditViewController"
    
}



// Mark Titles

struct Titles {
    
    static let deleteMsg = "Record deleted successfully"
    static let addMsg = "Record added successfully"
    static let editMsg = "Record edited successfully"
    static let errMsg =    "error: not a valid http response"
    static let cancleButtonText = "Cancle"
    static let doneButtonText = "Done"
    
}
struct ImageName {
    
    static let placeholder_photo = "placeholder_photo"
    static let home_favourite = "home_favourite"
    static let home_add = "home_add"
    static let fav_selected = "favourite_button_selected"
  
}


struct Static {
    static let nameTag = "name"
    static let lastNameTag = "lastName"
    static let emailTag = "email"
    static let phoneTag = "phone"
    
    static let first_name = "first_name"
    static let last_name = "last_name"
    static let mobileTag = "phone_number"
    
    static let favoriteTag = "favorite"
    
    static let jsonTag = ".json"
}

  

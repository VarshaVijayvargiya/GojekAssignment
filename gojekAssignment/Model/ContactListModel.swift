//
//  Contact.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 09/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import Foundation

struct ContactListModel{
    var first_name: String = ""
    var last_name: String = ""
    var profile_pic: String = ""
    var idd : Int
    var favorite : Bool
    
    
    init(json:JSON){
        first_name = json["first_name"].stringValue
        last_name = json["last_name"].stringValue
        profile_pic = json["profile_pic"].stringValue
        idd = json["id"].intValue
        favorite = json["favorite"].boolValue
    }
}

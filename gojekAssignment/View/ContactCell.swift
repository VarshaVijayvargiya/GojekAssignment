//
//  ContactCell.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 09/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var favImgView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

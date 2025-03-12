//
//  PhoneBookCell.swift
//  phoneBook
//
//  Created by ÖMER  on 19.02.2025.
//

import UIKit

class PhoneBookCell: UITableViewCell {

    @IBOutlet weak var phoneName: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

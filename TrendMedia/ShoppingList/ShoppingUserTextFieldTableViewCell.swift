//
//  ShopingUserTextFieldTableViewCell.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

class ShoppingUserTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func userTextFieldEntered(_ sender: UITextField) {
       
    }
    
    @IBAction func addButton(_ sender: UIButton) {
    }
}

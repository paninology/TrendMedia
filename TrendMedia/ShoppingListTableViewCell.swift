//
//  ShoppingListTableViewCell.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var shoppingImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func checkButtonClicked(_ sender: UIButton) {
    }
    @IBAction func starButtonClicked(_ sender: UIButton) {
    }
}

//
//  BucketListTableViewCell.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

class BucketListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var bucketListLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let identifier = "BucketListTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

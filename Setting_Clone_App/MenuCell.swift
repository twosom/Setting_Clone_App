//
//  MenuCell.swift
//  Setting_Clone_App
//
//  Created by Desire L on 2021/12/09.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet
    var leftImageView: UIImageView!

    @IBOutlet
    var middleTitle: UILabel!

    @IBOutlet
    var rightImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

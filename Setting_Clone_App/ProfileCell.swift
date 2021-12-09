//
//  ProfileCell.swift
//  Setting_Clone_App
//
//  Created by Desire L on 2021/12/08.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet
    var topTitle: UILabel!

    @IBOutlet
    var bottomDescription: UILabel!

    @IBOutlet
    var profileImageView: UIImageView!

    let PROFILE_HEIGHT: CGFloat = 60

    override
    func awakeFromNib() {
        super.awakeFromNib()
        /**
         cornerRadius 는 높이의 정확히 반절을 지정하면 동그랗게 깎인다.
         */
        profileImageView.layer.cornerRadius = PROFILE_HEIGHT / 2
        topTitle.textColor = .systemBlue
        topTitle.font = .systemFont(ofSize: 20)


        bottomDescription.textColor = .darkGray
        bottomDescription.font = .systemFont(ofSize: 16)

    }

    override
    func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

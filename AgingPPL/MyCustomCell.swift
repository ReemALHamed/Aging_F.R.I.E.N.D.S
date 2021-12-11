//
//  MyCustomCell.swift
//  AgingPPL
//
//  Created by admin on 06/12/2021.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var MyImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var RoleLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        MyImageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.layer.cornerRadius = 15
    }
}

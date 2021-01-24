//
//  SwitchTableViewCell.swift
//  TableView
//
//  Created by 이동규 on 2021/01/24.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let v = UISwitch(frame: .zero)
        accessoryView = v
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

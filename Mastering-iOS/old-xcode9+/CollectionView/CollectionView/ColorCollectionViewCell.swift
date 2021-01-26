//
//  ColorCollectionViewCell.swift
//  CollectionView
//
//  Created by 이동규 on 2021/01/26.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorView.clipsToBounds = true
        colorView.layer.cornerRadius = colorView.bounds.width / 2

    }
}

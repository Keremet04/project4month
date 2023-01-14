//
//  SecondCollectionViewCell.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    public static let reuseId2 = String(describing: SecondCollectionViewCell.self)

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    
     func display2(item: SecondModel) {
            photo.image = item.imagesecond
            nameLable.text = item.lable2
        }
    }


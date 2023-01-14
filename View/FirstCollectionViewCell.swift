//
//  FirstCollectionViewCell.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    public static let reusedId = String(describing: FirstCollectionViewCell.self)
    
    func display(item: CustomModel) {
        imageView.image = item.imageIconView
        nameLabel.text = item.lable
    }
    
        @IBInspectable
        private var cornerRadius: CGFloat {
            get { self.layer.cornerRadius }
            set { self.layer.cornerRadius = newValue }
        }

        @IBInspectable
        private var contentColor: UIColor {
            get { self.backgroundColor ?? .clear }
            set { self.backgroundColor = newValue }
        }
}

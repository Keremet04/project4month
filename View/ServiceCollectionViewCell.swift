//
//  FirstCollectionViewCell.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstCustom: UIView!
   @IBOutlet weak var imageView: UIImageView!
    public static let reusedId = String(describing: ServiceCollectionViewCell.self)
    
    func display(item: ServiceModel) {
        nameLabel.text = item.naming
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
    
    @IBInspectable
    private var borderWidth: CGFloat {
        get { self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable
    private var borderColor: CGColor {
        get { self.layer.borderColor ?? UIColor.clear.cgColor }
        set { self.layer.borderColor = newValue }
    }
    
}

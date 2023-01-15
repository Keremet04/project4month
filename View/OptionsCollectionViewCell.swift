//
//  SecondCollectionViewCell.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {
    public static let reuseId2 = String(describing: OptionsCollectionViewCell.self)

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var secondCustom: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
     func display2(item: OptionsModel) {
         photo.image = UIImage(named: item.image)
            nameLable.text = item.naming
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


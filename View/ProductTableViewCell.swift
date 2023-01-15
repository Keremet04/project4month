//
//  ProductTableViewCell.swift
//  hw1
//
//  Created by Керемет  on 27/12/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    public static let reuseID3 = String(describing: ProductTableViewCell.self)
    
    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var timeTable: UILabel!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var deliverytable: UILabel!
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var thirdCustomView: UIView!
    
    weak var delegate: ProductCellDelegate?
    private var product: ProductNodel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImgGestureRecognizer()
    }
    
    func display3(item: ProductNodel) {
        
        tableImage.image = UIImage(named: item.productImageIcon)
        mainLable.text = item.productName
        circle.image = UIImage(named: item.circle)
        timeTable.text = item.openClose
        timeTable.textColor = isSelected ? UIColor.white : UIColor.green
        star.image = UIImage(named: item.star)
        location.text = item.location
        deliverytable.text = item.delivery
        subName.text = item.subName
        score.text = item.score
        product = item
        
    }
    
    func productImgGestureRecognizer() {
        let navigateProductImageTap =
        UITapGestureRecognizer(target: self, action: #selector(navigateToDetailsViewController))
        tableImage.isUserInteractionEnabled = true
        tableImage.addGestureRecognizer(navigateProductImageTap)
    }
    
    @objc
    private func navigateToDetailsViewController() {
        guard let product = product else {
            return
        }
        delegate?.switchToTheImage(UIImage(named: product.productImageIcon)!)
    }
}

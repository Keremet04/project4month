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
    
    func display3(item: ProductNodel) {
        
    tableImage.image = item.productImageIcon
    mainLable.text = item.productName
    circle.image = item.circle
    timeTable.text = item.openClose
    star.image = item.star
    location.text = item.location
    deliverytable.text = item.delivery
    subName.text = item.subName
    score.text = item.score
        
    }
}

//
//  ViewController.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class ImageViewController: UIViewController {
    
    static var identifier = String(describing: ImageViewController.self)
    
    @IBOutlet weak var foodImage: UIImageView!
    
    var foodImagePhoto = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImage.image = foodImagePhoto
    }
}

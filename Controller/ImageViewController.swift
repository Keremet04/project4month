//
//  ViewController.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    static var identifier = String(describing: ImageViewController.self)
    var foodImagePhoto = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImage.image = foodImagePhoto
    }
}

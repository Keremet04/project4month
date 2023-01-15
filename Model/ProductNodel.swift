//
//  ProductModel.swift
//  hw1
//
//  Created by Керемет  on 27/12/22.
//

import Foundation
import UIKit

let productJSON = """

[
  {
    "productImageIcon": "photo2",
    "score": "4.5",
    "productName": "Vegetarian Pizza",
    "subName": "Italian | Burgers",
    "openClose": "OPEN",
    "delivery": "Delivery: FREE | Minimun: 10$"
    "location": "1.5 km away",
    "circle": "cirlce",
    "star": "star"
   },

{
        "productImageIcon": "photo1",
        "score": "4.5",
        "productName": "Burger Craze",
        "subName": "American | Burgers",
        "openClose": "OPEN",
        "delivery": "Delivery: FREE | Minimun: 10$"
        "location": "1.5 km away",
        "circle": "cirlce",
        "star": "star"
   }
]

"""

struct ProductNodel: Decodable {
    var productImageIcon: String
    var score: String
    var productName: String
    var subName: String
    var openClose: String
    var delivery: String
    var location: String
    var circle: String
    var star: String
}

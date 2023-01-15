//
//  ProuctModel.swift
//  hw1
//
//  Created by Керемет  on 26/12/22.
//


import UIKit

let serviceJSON = """

[
    {
      "image": "cart.fill",
      "naming": "Delivery",
      "isSelected": false
    },

    {
      "image": "car",
      "naming": "Pick UP",
      "isSelected": false
    },

    {
      "image": "powersleep",
      "naming": "Catering",
      "isSelected": false
    },

    {
      "image": "play",
      "naming": "Curbside",
      "isSelected": false
    },
]

"""


struct ServiceModel: ModelActions, Decodable {
    var image: String
    var naming: String
    var isSelected: Bool
}

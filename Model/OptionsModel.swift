//
//  SecondModel.swift
//  hw1
//
//  Created by Керемет  on 26/12/22.
//

import Foundation
import UIKit

let optionsJSON = """

[
  {
    "image: "pic6",
    "naming": "TakeAways"
    "IsSelected2": "False"
  },
 
   {
     "image: "pic2 1",
     "naming": "Grocery"
    "IsSelected2": "False"
   },

   {
      "image: "pic3",
      "naming": "Convenience"
      "IsSelected2": "False"
   },
 
   {
      "image: "pic4",
      "naming": "Pharmacy"
      "IsSelected2": "False"
   }
]

"""

struct OptionsModel: ModelActions, Decodable {
    var image: String
    var naming: String
    var isSelected: Bool
}

//
//  Country.swift
//  CountryInfo
//
//  Created by Enes Koç on 26.09.2024.
//

import Foundation
import UIKit

class Country {
    
    var name: String
    var zone : String
    var image : UIImage
    
    init(name: String, zone: String, image: UIImage){
        self.name = name
        self.zone = zone
        self.image = image
    }
    
    
}

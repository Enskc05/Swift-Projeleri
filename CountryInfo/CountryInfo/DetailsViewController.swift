//
//  DetailsViewController.swift
//  CountryInfo
//
//  Created by Enes Koç on 25.09.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var CountryZone: UILabel!
    @IBOutlet weak var CountryNameLabel: UILabel!
    @IBOutlet weak var CountryImageView: UIImageView!
    
    var selectedCountry : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CountryNameLabel.text = selectedCountry?.name
        CountryZone.text = selectedCountry?.zone
        CountryImageView.image = selectedCountry?.image
    }
    

}

//
//  DetailsViewController.swift
//  SupermanTableView
//
//  Created by Enes Koç on 24.09.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedSuperHeroName = ""
    var selectedSuperHeroImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: selectedSuperHeroImage)
        label.text = selectedSuperHeroName
    }
    
}

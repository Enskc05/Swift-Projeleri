//
//  ViewController.swift
//  JestSense
//
//  Created by Enes Koç on 21.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var CountryLabel: UILabel!
    
    var ankara = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    @objc func changeImage(){
        
        
        if ankara == false {
            imageView.image = UIImage(named: "ankara")
            CountryLabel.text = "Ankara"
            ankara = true
        }
        else {
            imageView.image = UIImage(named: "istanbul")
            CountryLabel.text = "Istanbul"
            ankara = false
        }
    }
}

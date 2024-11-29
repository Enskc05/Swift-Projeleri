//
//  IkinciViewController.swift
//  First-App
//
//  Created by Enes Koç on 20.09.2024.
//

import UIKit

class IkinciViewController: UIViewController {

    @IBOutlet weak var IkinciLabel: UILabel!

    @IBOutlet weak var bulunanSifreLabel: UILabel!
    
    var verilenSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bulunanSifreLabel.text = verilenSifre
    }
    

   

}

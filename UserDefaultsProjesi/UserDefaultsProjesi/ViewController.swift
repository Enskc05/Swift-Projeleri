//
//  ViewController.swift
//  UserDefaultsProjesi
//
//  Created by Enes Koç on 20.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zamanLabel: UITextField!
    
    @IBOutlet weak var notLabel: UITextField!
    
    @IBOutlet weak var yapilacakLabel: UILabel!
    
    @IBOutlet weak var yapilacakZamanLabel: UILabel!
    
    let kaydedilennot = UserDefaults.standard.object(forKey: "not")
    let kaydedilenzaman = UserDefaults.standard.object(forKey: "zaman")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gelenNot = kaydedilennot as? String {
            yapilacakLabel.text = "Yapılacak iş : \(gelenNot)"
        }
        if let gelenZaman = kaydedilenzaman as? String {
            yapilacakZamanLabel.text = "Yapialcak zaman : \(gelenZaman)"
        }
    }

    @IBAction func kayitTiklandi(_ sender: Any) {
        
        UserDefaults.standard.setValue(notLabel.text!, forKey:"not")
        UserDefaults.standard.setValue(zamanLabel.text!, forKey: "zaman")
        
        yapilacakLabel.text = "Yapılacak iş : \(notLabel.text!)"
        yapilacakZamanLabel.text  = "Yapılacak zaman: \(zamanLabel.text!)"
        
    }
    
    @IBAction func silTiklandi(_ sender: Any) {
        
        if (kaydedilennot as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "not")
            yapilacakLabel.text = "Yapılacak iş : "
        }
        if (kaydedilenzaman as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "zaman")
            yapilacakZamanLabel.text = "Yapılacak zaman :"
        }
        
    }
}


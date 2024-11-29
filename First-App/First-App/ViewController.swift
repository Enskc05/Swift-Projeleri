//
//  ViewController.swift
//  First-App
//
//  Created by Enes Koç on 20.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BirinciLabel: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
    
    var alınanSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.text = ""
        print("view will appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    
    
    @IBAction func kontrolEt(_ sender: Any) {
        
        alınanSifre = textField.text!
        if alınanSifre == "enes"{
            performSegue(withIdentifier: "toIkinciVc", sender: nil)
        }
        else{
            BirinciLabel.text = "Şifreniz Yanlış"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toIkinciVc" {
            let destinationVc = segue.destination as! IkinciViewController
            destinationVc.verilenSifre = alınanSifre
        }
            
        
        
    }
    
    
}


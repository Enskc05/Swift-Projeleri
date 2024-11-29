//
//  ViewController.swift
//  AlertMessage
//
//  Created by Enes Koç on 21.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignUpLabel: UILabel!
    @IBOutlet weak var MailTextView: UITextField!
    @IBOutlet weak var PassTextView: UITextField!
    @IBOutlet weak var PassAgainTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUpButton(_ sender: Any) {
        
        if MailTextView.text == ""{
            //E-mail boş girildi
            UyariMesaji(title: "Hata Mesajı", message: "E-mail boş bırakıldı")
        }
        
        else if (PassTextView.text == "") || (PassAgainTextView.text == "") {
            //Parola boş girildi
            UyariMesaji(title: "Hata Mesajı", message: "Şifre boş bırakıldı")
        }
        else if (PassTextView.text != PassAgainTextView.text){
            // Parolalar uyuşmuyor
            UyariMesaji(title: "Hata Mesajı", message: "Şifreler Uyuşmuyor")
        }
        else{
            //Kayıt olundu.
            UyariMesaji(title: "Tebrikler", message: "Kayıt olundu")
        }
        
    }
    func UyariMesaji(title: String , message: String){
        let uyariMesaji = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButtonu = UIAlertAction(title: "Ok ", style: UIAlertAction.Style.default) { UIAlertAction in
            // Ok butonuna tıklanınca olacaklar.
            print("Butona tıklandı")
        }
        uyariMesaji.addAction(okButtonu)
        self.present(uyariMesaji, animated:true, completion: nil)
    }
    
}


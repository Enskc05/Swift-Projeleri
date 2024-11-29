//
//  DetailsViewController.swift
//  ShoppingList
//
//  Created by Enes Koç on 27.09.2024.
//

import UIKit
import CoreData


class DetailsViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ProductNameTextField: UITextField!
    @IBOutlet weak var ProductPriceTextField: UITextField!
    @IBOutlet weak var ProductSİzeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeybord))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    @objc func imageTapped() {
        let picker  = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker , animated: true , completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
     @objc func closeKeybord() {
         view.endEditing(true)
    }

    @IBAction func SaveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let shopping = NSEntityDescription.insertNewObject(forEntityName: "Shopping", into: context) as! Shopping
        
        shopping.setValue(ProductNameTextField.text!, forKey: "name")
        
        shopping.setValue(ProductSİzeTextField.text!, forKey: "size")
        
        if let price = Int(ProductPriceTextField.text!) {
            shopping.setValue(price, forKey: "price")
        }
        
        shopping.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        shopping.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("Kayıt başarılı")
        }catch{
            print("Hata var")
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}

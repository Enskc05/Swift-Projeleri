//
//  ViewController.swift
//  ShoppingList
//
//  Created by Enes Koç on 27.09.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    var isimDizisi = [String]()
    var UUIDDizisi = [UUID]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        GetData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector (GetData), name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
    }
    
    @objc func GetData() {
        isimDizisi.removeAll(keepingCapacity: false)
        UUIDDizisi.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shopping")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                if let isim = data.value(forKey: "name") as? String {
                    isimDizisi.append(isim)
                }
                if let id = data.value(forKey: "id") as? UUID {
                    UUIDDizisi.append(id)
                }
                
            }
            
            TableView.reloadData()
            
        }catch{
            print("Hata var")
        }
        
    }
    
    
    
    @objc func addItem() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
    }
}


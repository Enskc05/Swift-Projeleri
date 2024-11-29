//
//  ViewController.swift
//  CountryInfo
//
//  Created by Enes Koç on 25.09.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    var countries = [Country]()
    var selectedUser: Country?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        
        
        let istanbul = Country(name: "Istanbul", zone: "Marmara", image: UIImage(named: "istanbul")!)
        let antalya = Country(name: "Antalya", zone: "Akdeniz", image: UIImage(named: "antalya")!)
        let afyon = Country(name: "Afyon", zone: "Ege", image:  UIImage(named: "afyon")!)
        let ankara = Country(name: "Ankara", zone: "İc Anadolu", image:  UIImage(named: "ankara")!)
        let batman = Country(name: "Batman", zone: "Doğu Anadolu", image:  UIImage(named: "batman")!)
        let izmir = Country(name: "Izmir", zone: "Ege", image:  UIImage(named: "izmir")!)
        
        
        countries=[istanbul,antalya,afyon,ankara,batman,izmir]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = countries[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as? DetailsViewController
            destinationVC?.selectedCountry = selectedUser
            
        }
    }
    
}


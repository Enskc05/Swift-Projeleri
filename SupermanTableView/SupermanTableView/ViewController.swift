//
//  ViewController.swift
//  SupermanTableView
//
//  Created by Enes Koç on 24.09.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superHero = [String]()
    var superHeroImage = [String]()
    var selectName = ""
    var selectImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        superHero.append("Hulk")
        superHero.append("Batman")
        superHero.append("İron Man")
        superHero.append("Spiderman")
        superHero.append("Captan Amerika")
        
        // var superHeroImage = [UIImage]()
        // superHeroImage.append(UIImage(named:"batman")!)
        
        superHeroImage.append("hulk")
        superHeroImage.append("batman")
        superHeroImage.append("ironman")
        superHeroImage.append("spiderman")
        superHeroImage.append("captainAmerica")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHero.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHero[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHero.remove(at: indexPath.row)
            superHeroImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectName = superHero[indexPath.row]
        selectImage = superHeroImage[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let vc = segue.destination as! DetailsViewController
            vc.selectedSuperHeroName = selectName
            vc.selectedSuperHeroImage = selectImage
        }
    }
}


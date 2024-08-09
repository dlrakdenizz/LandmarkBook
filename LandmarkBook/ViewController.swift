//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Dilara Akdeniz on 9.08.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Amazon")
        landmarkNames.append("Big Ben")
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Giza")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Opera House")
        landmarkNames.append("Pisa Tower")
        landmarkNames.append("Statue of Liberty")
        landmarkNames.append("Taj Mahal")
        
       
        landmarkImages.append(UIImage(named: "amazon")!)
        landmarkImages.append(UIImage(named: "bigBen")!)
        landmarkImages.append(UIImage(named: "eiffelTower")!)
        landmarkImages.append(UIImage(named: "giza")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "operaHouse")!)
        landmarkImages.append(UIImage(named: "pisaTower")!)
        landmarkImages.append(UIImage(named: "StatueOfLiberty")!)
        landmarkImages.append(UIImage(named: "tajMahal")!)
         
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"  //Eski yöntem
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            //self.tableView.reloadData()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}


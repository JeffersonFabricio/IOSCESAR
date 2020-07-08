//
//  PaisesViewController.swift
//  campeoes
//
//  Created by aluno on 06/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class PaisesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var worldCups: [WorldCup] = []
    var countries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPaises()

    }
    
    func loadPaises() {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: fileURL)
         
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
            for worldCup in worldCups {
                for game in worldCup.matches[0].games {
                    let countryHome = game.home
                    if !countries.contains(countryHome) {
                        countries.append(countryHome)
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.countries[indexPath.item]
        cell.myImageView.image = UIImage(named: self.countries[indexPath.item])
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell

    }
    
}

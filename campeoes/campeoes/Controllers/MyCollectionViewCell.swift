//
//  MyCollectionViewCell.swift
//  campeoes
//
//  Created by aluno on 06/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    func prepare(with game: Game){
        myImageView.image = UIImage(named: game.home)
        myLabel.text = game.home
    }
    
}


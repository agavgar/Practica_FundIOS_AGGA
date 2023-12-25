//
//  CustomCollectionViewCell.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "CustomCollectionViewCell"

    //MARK: - Outlets
    
    
    @IBOutlet var heroName: UILabel!
    //@IBOutlet var heroImage: UIImageView!
    
    
    //MARK: - Configure
    func configure(with heroe:HeroesData){
        heroName.text = heroe.name
        //heroImage.image = UIImage(named: heroe.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}

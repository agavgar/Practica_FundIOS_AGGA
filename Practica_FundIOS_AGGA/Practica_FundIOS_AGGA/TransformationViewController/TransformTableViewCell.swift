//
//  TransformTableViewCell.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class TransformTableViewCell: UITableViewCell {

    //MARK: - Identifier
    
    static let identifier = "CustomTableViewCell"

    //MARK: - Outlets
    
    
    @IBOutlet var transformName: UILabel!
    //@IBOutlet var transformImage: UIImageView!
    @IBOutlet var transformInfo: UILabel!
    
    //MARK: - Configure
    func configure(with transform:HeroTransformData){
        transformName.text = transform.title
        transformInfo.text = transform.description
        //transformImage.image = UIImage(named: transform.image)
        //heroImage.image = UIImage(named: heroe.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

//
//  TransformTableViewCell.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class TransformTableViewCell: UITableViewCell {

    //MARK: - Identifier
    static let identifier = "TransformTableViewCell"

    //MARK: - Outlets
    @IBOutlet var transformName: UILabel!
    @IBOutlet var transformImage: UIImageView!
    @IBOutlet var transformInfo: UILabel!
    
    //MARK: - Configure
    func configure(with transform:HeroTransform){
        transformName.text = transform.name
        transformInfo.text = transform.description
        transformImage.setImage(url: transform.photo)
    }
}

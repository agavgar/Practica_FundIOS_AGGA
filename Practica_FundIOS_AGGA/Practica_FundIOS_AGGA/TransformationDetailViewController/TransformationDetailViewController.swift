//
//  TransformationDetailViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class TransformationDetailViewController: UIViewController {

    var transformDetail = HeroTransform(id: "", name: "", description: "", photo: "")
    
    @IBOutlet var transformImage: UIImageView!
    @IBOutlet var transformName: UILabel!
    @IBOutlet var transformDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }

    func updateUI(){
        transformName.text = transformDetail.name
        transformDescription.text = transformDetail.description
        //transform.image = transformDetail.photo
    }
    
}

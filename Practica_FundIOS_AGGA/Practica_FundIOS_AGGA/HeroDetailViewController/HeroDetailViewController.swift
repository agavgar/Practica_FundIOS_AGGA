//
//  HeroDetailViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class HeroDetailViewController: UIViewController {

    let heroeDetail = HeroesData.goku
    
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroDescription: UILabel!
    @IBOutlet var botonTransformaciones: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        
        if !heroeDetail.[transformaciones].isEmpty {
            botonTransformaciones.isHidden = true
        }else{
            botonTransformaciones.isHidden = false
        }
         
         */
            
    }

    @IBAction func butonTransform(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToTransformsList", sender: self)
    }

}

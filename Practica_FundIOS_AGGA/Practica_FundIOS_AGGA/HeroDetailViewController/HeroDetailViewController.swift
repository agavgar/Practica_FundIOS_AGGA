//
//  HeroDetailViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    var heroDetail: HeroDragonBall?
    var heroTransformation: [HeroTransform]?
    //private let model = NetworkModel.shared
    
    //@IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroDescription: UILabel!
    @IBOutlet var botonTransformaciones: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard heroDetail != nil else { return }
        guard heroTransformation != nil else { return }
        
        showButton(cantidad: heroTransformation?.count)
        updateUI()
        
    }
    
    @IBAction func butonTransform(_ sender: UIButton) {
        
        let transformDetail = TransformationListTableViewController(nibName: "TransformationListTableViewController", bundle: nil)
        transformDetail.transformList = heroTransformation!
        navigationController?.pushViewController(transformDetail, animated: true)
        
    }
    
    func updateUI(){
        heroName.text = heroDetail?.name
        heroDescription.text = heroDetail?.description
        //heroImage.image = heroDetail?.photo
    }
    
    func showButton(cantidad: Int?){
        if cantidad != nil {
            if cantidad == 0 {
                botonTransformaciones.isHidden = true
            }else{
                botonTransformaciones.isHidden = false
            }
        }
    }
    
}

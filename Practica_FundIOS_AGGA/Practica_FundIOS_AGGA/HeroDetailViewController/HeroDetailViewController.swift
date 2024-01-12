//
//  HeroDetailViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class HeroDetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroDescription: UILabel!
    @IBOutlet var botonTransformaciones: UIButton!
    
    //MARK: - Models
    private let hero: HeroDragonBall
    private let heroTransformation: [HeroTransform]
    
    //MARK: - Initializers
    init(hero: HeroDragonBall, transform: [HeroTransform]){
        self.hero = hero
        self.heroTransformation = transform
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init (coder: ) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showButton(cantidad: heroTransformation.count)
        updateUI()
        
    }
    
    //MARK: - Actions
    @IBAction func butonTransform(_ sender: UIButton) {
        
        let transformList = TransformationListTableViewController(transformList:heroTransformation)
        navigationController?.show(transformList, sender: nil)
        
    }
    
    //MARK: - ViewFunction
    func updateUI(){
        heroName.text = hero.name
        heroDescription.text = hero.description
        heroImage.setImage(url: hero.photo)
    }
    
    func showButton(cantidad: Int?){
        if cantidad == 0 {
            botonTransformaciones.isHidden = true
        }else{
            botonTransformaciones.isHidden = false
        }
    }
    
}

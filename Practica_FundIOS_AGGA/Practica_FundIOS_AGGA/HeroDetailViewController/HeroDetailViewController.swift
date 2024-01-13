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
    
    @IBAction func buttonTouchCancel(_ sender: Any) {
        zoomOut()
        botonTransformaciones.tintColor = ColorPalette.customYellow
    }
    
    @IBAction func buttonTouchDown(_ sender: Any) {
        zoomIn()
    }
    
    @IBAction func butonTransform(_ sender: UIButton) {
        
        botonTransformaciones.tintColor = ColorPalette.customYellowPressed
        
        let transformList = TransformationListTableViewController(transformList:heroTransformation)
        navigationController?.show(transformList, sender: nil)
    }
    
    //MARK: - UIFunction
    func updateUI(){
        heroName.text = hero.name
        heroDescription.text = hero.description
        heroImage.setImage(url: hero.photo)
        
        let logo = UIImage(named: "DragonBallLogo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size = CGSize(width: 50, height: 15)
        navigationItem.titleView = imageView
        
        navigationItem.backBarButtonItem?.title = "Heroes"
        navigationItem.backBarButtonItem?.tintColor = ColorPalette.customYellow
        
        botonTransformaciones.tintColor = ColorPalette.customYellow
        
    }
    
    func showButton(cantidad: Int?){
        if cantidad == 0 {
            botonTransformaciones.isHidden = true
        }else{
            botonTransformaciones.isHidden = false
        }
    }
    
}

//MARK: - Animations
extension HeroDetailViewController {
    func zoomIn() {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.15,
            initialSpringVelocity: 0.5
        ) { [weak self] in
            self?.botonTransformaciones.transform = .identity
                .scaledBy(x: 0.9, y: 0.9)
        }
    }
    
    func zoomOut() {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 2
        ) { [weak self] in
            self?.botonTransformaciones.transform = .identity
        }
    }
}

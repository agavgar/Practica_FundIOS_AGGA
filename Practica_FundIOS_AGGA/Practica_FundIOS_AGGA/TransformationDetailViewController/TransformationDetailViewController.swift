//
//  TransformationDetailViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class TransformationDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var transformImage: UIImageView!
    @IBOutlet var transformName: UILabel!
    @IBOutlet var transformDescription: UILabel!
    
    //MARK: - Models
    private var transformDetail:HeroTransform
    
    //MARK: - Initializer
    init(transformationDetail: HeroTransform) {
        self.transformDetail = transformationDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*,unavailable)
    required init?(coder: NSCoder) {
        fatalError(" Init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }

    func updateUI(){
        transformName.text = transformDetail.name
        transformDescription.text = transformDetail.description
        transformImage.setImage(url: transformDetail.photo)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "goHeroes", style: .plain, target: self, action: #selector(goHeroes))
        
        navigationItem.rightBarButtonItem?.tintColor = ColorPalette.customYellow
        navigationItem.backBarButtonItem?.tintColor = ColorPalette.customYellow
        
        
        let logo = UIImage(named: "DragonBallLogo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size = CGSize(width: 50, height: 15)
        navigationItem.titleView = imageView
        navigationItem.backBarButtonItem?.title = "Transform"
    }
    
    @objc
    func goHeroes(_sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

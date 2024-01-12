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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(logOut))
    }
    
    @objc
    func logOut(_sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

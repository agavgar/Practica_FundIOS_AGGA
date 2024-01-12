//
//  LoginViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class LoginViewController: UIViewController {
//MARK: - Outlets
    @IBOutlet weak var emailUserName: UITextField!
    @IBOutlet weak var passwordUser: UITextField!
    
    //MARK: - Model
    private let model = NetworkModel.shared
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func checkLogin(_ sender: UIButton) {
        model.login(user: emailUserName.text ?? "", password: passwordUser.text ?? "") { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(_):
                
                DispatchQueue.main.async {
                    let heroeCollectionViewController = HeroeCollectionViewController()
                    self.navigationController?.setViewControllers([heroeCollectionViewController], animated: true)
                }
                
            case let.failure(error): print("\(error)")
            }
        }
    }
}

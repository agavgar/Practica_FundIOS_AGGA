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
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Model
    private let model = NetworkModel.shared
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginButton.tintColor = ColorPalette.customYellow
        
    }
    
    //MARK: - Actions
    
    @IBAction func buttonTouchCancel(_ sender: Any) {
        zoomOut()
    }
    
    @IBAction func buttonTouchDown(_ sender: Any) {
        zoomIn()
    }
    
    @IBAction func checkLogin(_ sender: UIButton) {
        
        self.loginButton.tintColor = ColorPalette.customYellowPressed
        self.loginButton.titleLabel?.text = "Loading"
        
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

//MARK: - Animations
extension LoginViewController {
    func zoomIn() {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.15,
            initialSpringVelocity: 0.5
        ) { [weak self] in
            self?.loginButton.transform = .identity
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
            self?.loginButton.transform = .identity
        }
    }
}

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
        model.login(user: emailUserName.text ?? "", password: passwordUser.text ?? "") { result in
            switch result {
            case let .success(token):print("✅ \(token)")
            case let.failure(error): print("🔴 \(error)")
            }
        }
    }
}

//
//  LoginViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailUserName: UITextField!
    @IBOutlet var passwordUser: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func checkLogin(_ sender: UIButton) {
        
        let loginAPI = APIController()
        if loginAPI.tryLogin(username: emailUserName.text ?? "", password: passwordUser.text ?? ""){
            performSegue(withIdentifier: "goToHeroes", sender: self)
        }else{
            performSegue(withIdentifier: "goToHeroes", sender: self)
        }
        
        
        
    }
}

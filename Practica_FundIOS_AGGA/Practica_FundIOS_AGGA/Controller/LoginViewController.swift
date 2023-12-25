//
//  LoginViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 20/12/23.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var userMail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        if comprobarLogin(email: userMail.text, password: userPassword.text){
            
            let characterCollectionView = CharacterCollectionView(nibName: "CharacterCollectionView", bundle: nil)
            self.show(characterCollectionView, sender: nil)
        }
        
        
    }
    
    func comprobarLogin(email:String?,password:String?)->Bool{
        
        if email != nil && password != nil{
            return email == "1" && password == "1" ? true : false
        }else{
            return false
        }
        
    }
    
}

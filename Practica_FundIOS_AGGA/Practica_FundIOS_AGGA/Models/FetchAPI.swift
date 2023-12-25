//
//  FetchAPI.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 24/12/23.
//


/*
import Foundation

enum DataPath: String, Equatable{
    case hero = "/api/heros/all"
    case login = "/api/auth/login"
    case transform = "/api/heros/trasformations"
}

struct APIData{
    
    let dragonBallURL = "https://dragonball.keepcoding.education/"
    
    func fetchLogin(username: String, password: String)-> Bool {
        let login = requestJSON(typeCase: .login)
        return login.0 == username && login.1 == password
    }
    
    func fetchHero()->HeroesData?{
        let foundHero = requestJSON(typeCase: .hero)
        let newHero = HeroesData(name: foundHero.0, description: foundHero.1, image: foundHero.2)
        
        return newHero
    }
    
    func fetchTransformation()->HeroTransformData?{
        let foundtransform = requestJSON(typeCase: .transform)
        let newTransform = HeroTransformData(title: foundtransform.0, description: foundtransform.1, image: foundtransform.2)
        
        return newTransform
    }
    
    
    func requestJSON(typeCase: DataPath)-> (String,String,String){
        
        let urlString = dragonBallURL+typeCase.rawValue
        
        print(urlString)
        // Crear una URL
        if let url = URL(string: urlString){
            // Crear una Session de URL
            let session = URLSession(configuration: .default)
            // Darle la session a la operacion
            let task = session.dataTask(with: url){ (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    if typeCase == .hero{
                        if let hero = self.HeroJSON(heroData: safeData){
                            return (hero.name,
                                    hero.description,
                                    hero.image)
                        }
                    }else if typeCase == .login{
                        if let login = self.LoginJSON(loginInfo: safeData){
                            return (self.login.username,
                                    self.login.password,"")
                        }
                    }else if typeCase == .transform{
                        if let transform = self.TransformJSON(heroInfo: safeData){
                            return (self.transform.name,
                                    self.transform.description,
                                    self.transform.image)
                        }
                    }
                    
                }
            }
            task.resume()
        }
        
    }
    
    
    func HeroJSON(heroData: Data) -> HeroesData? {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(HeroesData.self, from: heroData)
            let name = decodedData.name
            let descripcion = decodedData.description
            let image = decodedData.image
            
            let heroInfo = HeroesData(name: name, description: descripcion, image: image)
            
            return heroInfo
            
        }catch{
            print(error)
            return nil
        }
    }
    
    func LoginJSON(loginInfo: Data) -> LoginData? {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(LoginData.self, from: loginInfo)
            let username = decodedData.username
            let password = decodedData.password
            
            let loginData = LoginData(username: username, password: password)
            
            return loginData
            
        }catch{
            print(error)
            return nil
        }
    }
    
    func TransformJSON(heroInfo: Data) -> HeroTransformData? {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(HeroTransformData.self, from: heroInfo)
            let title = decodedData.title
            let descripcion = decodedData.description
            let image = decodedData.image
            
            let transformInfo = HeroTransformData(title: title, description: descripcion, image: image)
            
            return transformInfo
            
        }catch{
            print(error)
            return nil
        }
    }
    
    
}
*/

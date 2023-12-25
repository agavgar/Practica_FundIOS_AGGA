//
//  APIController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import Foundation

struct APIController{
    
    let dragonBallURL = "https://dragonball.keepcoding.education/"
    
    enum DataPath: String, Equatable{
        case hero = "/api/heros/all"
        case login = "/api/auth/login"
        case transform = "/api/heros/trasformations"
    }
    
    func fetch<T>(typeCase: DataPath, decodeType: T.Type) -> T? where T: Decodable {
        var decodedData: T? = nil
        let urlString = dragonBallURL + typeCase.rawValue
        print(urlString)

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    print(error)
                }

                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        decodedData = try decoder.decode(decodeType, from: safeData)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        return decodedData
    }

    
    func tryLogin(username: String, password:String)->Bool{
        let fetchLogin = fetch(typeCase: .login, decodeType: LoginData.self)
        return username == fetchLogin?.username && password == fetchLogin?.password
    }
    
    func addingHeroes()->HeroesData?{
        return fetch(typeCase: .hero, decodeType: HeroesData.self)
    }
    
    func addTransform()->HeroTransformData?{
        return fetch(typeCase: .hero, decodeType: HeroTransformData.self)
    }
}

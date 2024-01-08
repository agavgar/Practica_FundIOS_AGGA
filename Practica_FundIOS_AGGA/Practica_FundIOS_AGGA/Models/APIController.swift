//
//  APIController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import Foundation

struct APIController{
    
    let dragonBallURL = "https://dragonball.keepcoding.education/"
    let token = "eyJraWQiOiJwcml2YXRlIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJpZGVudGlmeSI6IjFBNDI0NDZFLUI5M0MtNEI3RS04MzQxLTBEQTVCOERCQjdDMiIsImVtYWlsIjoiYWxleC5nYXZpcmFAZ21haWwuY29tIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.ZHqui-H7UdhB7hF6Q8ecb8iellXjsI-UW359w3lZ158"
    
    enum DataPath: String, Equatable{
        case hero = "/api/heros/all"
        case login = "/api/auth/login"
        case transform = "/api/heros/trasformations"
    }
    
    func fetch<T>(typeCase: DataPath, decodeType: T.Type) -> T? where T: Decodable {
        var decodedData: T? = nil
        let urlString = dragonBallURL + typeCase.rawValue
        print(urlString)
        
        var request = URLRequest(url: URL(string: urlString)!)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        print(request)

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

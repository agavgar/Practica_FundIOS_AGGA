//
//  NetworkModel.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 8/1/24.
//

import Foundation

final class NetworkModel {
    // Creamos un singleton de Network Model
    // Siempre estara viva en todo momento de la aplicacion
    static let shared = NetworkModel()
    
    private var token: String? {
        get {
            if let token = LocalDataModel.getToken(){
                return token
            }
            return nil
        }
        set{
            if let token = newValue {
                LocalDataModel.save(token: token)
            }
        }
    }
    
    private var baseComponents:URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dragonball.keepcoding.education"
        return components
    }
    
    private let client: APIClientProtocol
    
    // Inicializador privado para prevenir que tengan acceso
    // pueda ser instanciado desde fuera
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func login(user: String, password: String, completion: @escaping (Result<String, DragonBallError>)-> Void){
        var components = baseComponents
        components.path = "/api/auth/login"
        
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        // Le damos un formato de tipo usuario:contraseña
        let loginString = String(format: "%@:%@", user, password)
        guard let loginData = loginString.data(using: .utf8) else {
            completion(.failure(.encodingFail))
            return
        }
        // Encodificamos el string con un algoritmo criptografico
        // en base 64
        let base64LoginString = loginData.base64EncodedString()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        client.jwt(urlRequest) { [weak self] result in
            switch result {
                case let .success(token):
                    self?.token = token
                    LocalDataModel.save(token: token)
                    completion(.success(token))
                case let .failure(error):
                    completion(.failure(error))
            }
        }
        
    }
    
    
    func getHeroes(completion: @escaping (Result<[HeroDragonBall], DragonBallError>)-> Void){
        var components = baseComponents
        components.path = "/api/heros/all"
        
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        guard let token else {
            completion(.failure(.tokenNoEncontrado))
            return
        }
                    
                    
        // Crear un objeto URLComponents, para encodificarlo posteriormente
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name:"name", value:"")]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        client.request(urlRequest, using: [HeroDragonBall].self, completion: completion)
    }
    
    func getTransformation(id:String,completion: @escaping (Result<[HeroTransform], DragonBallError>)-> Void){
        var components = baseComponents
        components.path = "/api/heros/tranformations"
        
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        guard let token else {
            completion(.failure(.tokenNoEncontrado))
            return
        }
                    
                    
        // Crear un objeto URLComponents, para encodificarlo posteriormente
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name:"id", value:id)]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        client.request(urlRequest, using: [HeroTransform].self, completion: completion)
    }
    
    
}

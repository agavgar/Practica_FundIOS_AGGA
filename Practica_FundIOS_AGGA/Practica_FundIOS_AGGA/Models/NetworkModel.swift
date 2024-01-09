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
    
    private var baseComponents:URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dragonball.keepcoding.education"
        return components
    }
    
    private let client: APIClientProtocol
    
    // Inicializador privado para prevenir que tengan acceso
    // pueda ser instanciado desde fuera
    private init(client: APIClientProtocol = APIClient()) {
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
        
        client.jwt(urlRequest, completion: completion)
    }
    
    func requestHeroes(completion: @escaping (Result<[HeroesData], DragonBallError>)-> Void){
        var components = baseComponents
        components.path = "/api/heroes/all"
        
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            return print("Token no encontrado")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        client.requestHeroe(urlRequest, completion: completion)
    }
    
    
}

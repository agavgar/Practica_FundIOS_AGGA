//
//  NetworkModelTests.swift
//  Practica_FundIOS_AGGATests
//
//  Created by Alejandro Alberto Gavira García on 9/1/24.
//

import XCTest
@testable import Practica_FundIOS_AGGA

final class NetworkModelTests: XCTestCase {
    private var sut: NetworkModel!
    private var expectedToken = "token"
    private var expectedHero: [HeroDragonBall] = [
    HeroDragonBall(id: "12323-132-12312", name: "Mr Satan Godo", description: "alsdjkhajklsasdasdasdasdasdhasldla", photo: "dasdasdasdadas")
    ]
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let client = APIClient(session: session)
        sut = NetworkModel(client: client)
        expectedToken = "token"
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        expectedToken = ""
    }
    
    func test_login() throws {
        // Given
        // Codificar el expected token a data
        let tokenData = try XCTUnwrap(expectedToken.data(using: .utf8))
        // Crear usuario y contraseña mockeadas para pasarlas al metodo login
        let (user, password) = ("user", "password")
        // Nos aseguramos que URLProtocol esta bien configurado
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { request in
            // Configuramos el login string
            let loginString = String(format: "%@:%@", user, password)
            let base64String = loginString.data(using: .utf8)!.base64EncodedString()
            // Nos aseguramos que el metodo HTTP es el correcto
            XCTAssertEqual(request.httpMethod, "POST")
            // Nos aseguramos que el header the autenticacion es el correcto
            XCTAssertEqual(
                request.value(forHTTPHeaderField: "Authorization"),
                "Basic \(base64String)"
            )
            // Creamos la respuesta mockeada
            // Esto actua como un servidor "real" en los tests
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: URL(string: "https://dragonball.keepcoding.education/")!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: ["Content-Type": "application/json"]
                )
            )
            return (response, tokenData)
        }
        
        // When
        let expectation = expectation(description: "Login success")
        var receivedToken: String?
        sut.login(
            user: user,
            password: password
        ) { result in
            guard case let .success(token) = result else {
                XCTFail("Expected success but received \(result)")
                return
            }
            receivedToken = token
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(receivedToken)
        XCTAssertEqual(receivedToken, expectedToken)
    }
    
    func test_Heroe() throws {
        // Given
        // Codificar el expected hero a dat
        
        let encodedHero = encodeHero(expectedHero)
        let heroData = try XCTUnwrap(encodedHero,"No nil result")
        // Usar el token para enviar la información
        let tokenRequest = LocalDataModel.getToken()
        // Nos aseguramos que URLProtocol esta bien configurado
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { request in
            
            // Nos aseguramos que el metodo HTTP es el correcto
            XCTAssertEqual(request.httpMethod, "POST")
            // Nos aseguramos que el header the autenticacion es el correcto
            XCTAssertEqual(
                request.value(forHTTPHeaderField: "Authorization"),
                "Bearer \(tokenRequest)")
            // Creamos la respuesta mockeada
            // Esto actua como un servidor "real" en los tests
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: URL(string: "https://dragonball.keepcoding.education/")!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: ["Content-Type": "application/json"]
                )
            )
            return (response, heroData)
        }
        
        // When
        let expectation = expectation(description: "Login success")
        var receivedHero: [HeroDragonBall] = []
        sut.getHeroes() { result in
            guard case let .success(hero) = result else {
                XCTFail("Expected success but received \(result)")
                return
            }
            receivedHero = hero
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(receivedHero)
        XCTAssertEqual(receivedHero, expectedHero)
    }
    
    func encodeHero(_ hero: [HeroDragonBall]) -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(hero)
    }
    
}

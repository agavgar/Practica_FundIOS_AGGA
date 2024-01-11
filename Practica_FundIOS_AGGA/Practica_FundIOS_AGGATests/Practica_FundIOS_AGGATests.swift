//
//  Practica_FundIOS_AGGATests.swift
//  Practica_FundIOS_AGGATests
//
//  Created by Alejandro Alberto Gavira García on 18/12/23.
//

import XCTest
@testable import Practica_FundIOS_AGGA

final class Practica_FundIOS_AGGATests: XCTestCase {
    
    private var token: String?
    
    override func setUp() {
        super.setUp()
        print("SetUp para cada test")
    }
    
    override class func setUp() {
        super.setUp()
        print("SetUp para toda la clase")
    }
    
    override func tearDown() {
        super.tearDown()
        print("TearDown para cada test")
    }
    
    override class func tearDown() {
        super.tearDown()
        print("TearDown para toda la clase")
    }

    func test_HelloWorld() {
        token = "Hello World"
        
        XCTAssertEqual(token, "Hello World")
        XCTAssertNotEqual(token, "HolaMundo")
    }

    func test_notHelloWorld(){
        XCTAssertNil(token)
    }

}

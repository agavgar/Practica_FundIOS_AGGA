//
//  HeroesData.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 24/12/23.
//

import Foundation

struct LoginData:Codable{
    let username: String
    let password:String
}

struct HeroTransformData:Codable{
    let title: String
    let description: String
    let image:String
}

struct HeroesData:Codable{
    let name: String
    let description: String
    let image: String
    // let evolutions: [HeroTransformData]
}

#if DEBUG

extension HeroesData {
    static var goku: HeroesData {
        HeroesData(name: "Goku", description: "Erase una vez un skladjadlkasjdakl", image: "Imagen")
    }
    
    static var vegetta: HeroesData {
        HeroesData(name: "Vegeta", description: "Principe Saiyan", image: "PrincipeVegeta")
    }
    
    static var cell: HeroesData {
        HeroesData(name: "Celula", description: "jdhakljsdhajksda", image: "jklashdjkas")
    }
}

#endif


#if DEBUG

extension HeroTransformData {
    static var goku: HeroTransformData {
        HeroTransformData(title: "Goku", description: "Erase una vez un skladjadlkasjdakl", image: "Imagen")
    }
    
    static var vegetta: HeroTransformData {
        HeroTransformData(title: "Vegeta", description: "Principe Saiyan", image: "PrincipeVegeta")
    }
    
    static var cell: HeroTransformData {
        HeroTransformData(title: "Celula", description: "jdhakljsdhajksda", image: "jklashdjkas")
    }
}

#endif

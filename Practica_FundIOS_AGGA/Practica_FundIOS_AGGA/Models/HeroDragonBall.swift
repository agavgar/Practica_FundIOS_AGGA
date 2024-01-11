//
//  HeroesData.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 24/12/23.
//

import Foundation

struct HeroTransform:Codable{
    let id: String
    let name: String
    let description: String
    let photo:String
}

struct HeroDragonBall:Codable{
    let id: String
    let name: String
    let description: String
    let photo: String
}

#if DEBUG
/*
extension HeroDragonBall {
    static var goku: HeroDragonBall {
        HeroDragonBall(name: "Goku", description: "Erase una vez un skladjadlkasjdakl", image: "Imagen")
    }
    
    static var vegetta: HeroDragonBall {
        HeroDragonBall(name: "Vegeta", description: "Principe Saiyan", image: "PrincipeVegeta")
    }
    
    static var cell: HeroDragonBall {
        HeroDragonBall(name: "Celula", description: "jdhakljsdhajksda", image: "jklashdjkas")
    }
}

#endif


#if DEBUG

extension TransformHero {
    static var goku: TransformHero {
        TransformHero(title: "Goku", description: "Erase una vez un skladjadlkasjdakl", image: "Imagen")
    }
    
    static var vegetta: TransformHero {
        TransformHero(title: "Vegeta", description: "Principe Saiyan", image: "PrincipeVegeta")
    }
    
    static var cell: TransformHero {
        TransformHero(title: "Celula", description: "jdhakljsdhajksda", image: "jklashdjkas")
    }
}
 */
#endif
 

//
//  player.swift
//  game
//
//  Created by Artem Leschenko on 04.02.2023.
//

import Foundation

struct Player{
    
    var name:String
    private(set) var score = 0
    
    mutating func add(score:Int){
        self.score += score
    }
}

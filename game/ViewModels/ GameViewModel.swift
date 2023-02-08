//
//  gameviewmodel.swift
//  game
//
//  Created by Artem Leschenko on 04.02.2023.
//

import Foundation

enum wordError: Error{
    
    case sameWord
    case beforword
    case smallword
    case wrongword
    case neponatochka
    
}


class GameViewModel:ObservableObject{
    
    @Published var player1:Player
    @Published var player2:Player
    @Published var words = [String]()
    let word: String
    public var isFirst = true
    
    init(player1: Player, player2: Player, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
    }
    
    func validate(word:String) throws{
        
        let word = word.uppercased()
        guard word != self.word else{
            throw wordError.sameWord
        }
        
        guard !self.words.contains(word) else {
            throw wordError.beforword
        }
        
        guard word.count > 1 else {
            throw wordError.smallword
        }
        
        return
    }
    
    func wordToChars(word:String)->[Character]{
        return [Character](word.uppercased())
    }
    
    
    func check(word:String) throws ->Int{
        
        do{
            try self.validate(word: word)
        } catch{
            throw error
        }
 
        var bigwArray = wordToChars(word: self.word)
        var smallwArray = wordToChars(word: word)
        var result = ""
        
        for i in smallwArray{
            if bigwArray.contains(i){
                result.append(i)
                 bigwArray.remove(at: bigwArray.firstIndex(of: i)!)
                smallwArray.remove(at: smallwArray.firstIndex(of: i)!)
            } else {
                throw wordError.wrongword
            }
        }
        
        guard result == word.uppercased() else{
            print("dcs")
            return 0
        }
        
        words.append(result)
        
        if isFirst{
            player1.add(score: word.count)
        }else{
            player2.add(score: word.count)
        }
        
        isFirst.toggle()

        return result.count
    }
}

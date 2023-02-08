//
//  ContentView.swift
//  osnova
//
//  Created by Artem Leschenko on 03.02.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var bigword = ""
    @State var first_p = ""
    @State var second_p = ""
    
    @State var inGame = false
    @State var isAlert = false
    
    var body: some View {
        
        ZStack{
            Image("Image").resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                TitleText(text: "Не знаю що тут написати")
                
                textFild(word: $bigword, placeholder: "Введіть ваше слово")
                    .padding(.top, 50)
                
                textFild(word: $first_p, placeholder: "Перший гравець")
                    .padding(.top, 30)
                
                textFild(word: $second_p, placeholder: "Другий гравець")
                
                Button() {
                    
                    if bigword.count > 6 {
                        inGame.toggle()
                    }else{
                        isAlert.toggle()
                    }
                } label: {
                    Text("Почати")
                        .font(.custom("AvenirNext-Bold", size: 23))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(Color.white)
                        .background(Color("maincolor"))
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
            }
        }
        .alert("Слово має менше 6 букв", isPresented: $isAlert, actions: {
            Text("Змінити слово")
        })
        .fullScreenCover(isPresented: $inGame) {
            
            let name1 = first_p == "" ? "Гравець 1" : first_p
            let name2 = second_p == "" ? "Гравець 2" : second_p
            
            let player1 = Player(name: name1)
            let player2 = Player(name: name2)
            
            GameView(viewModel: GameViewModel(player1: player1, player2: player2, word: self.bigword))
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

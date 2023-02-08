//
//  GameView.swift
//  game
//
//  Created by Artem Leschenko on 03.02.2023.
//

import SwiftUI

struct GameView: View {
    
    var viewModel: GameViewModel
    
    @State private var word = ""
    @State var  eror = false
    @State var confirmDismiss = false
    @State var alert = false
    @State var textalert = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        VStack(spacing: 20){
            
            HStack {
                Button {
                    confirmDismiss.toggle()
                } label: {
                    Text("  \(Image(systemName: "arrow.backward")) Назад")
                        .font(.custom("AvenirNext-Bold", size: 23))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .foregroundColor(Color.white)
                        .background(Color("maincolor"))
                        .cornerRadius(10)
                        .padding(.leading, -10)
                }
                Spacer()
            }
            
            
            Text(viewModel.word)
                .foregroundColor(Color.yellow)
                .font(.custom("AvenirNext-Bold", size: 36))
                .frame(maxWidth: 350)
                .background(Color("maincolor"))
                .cornerRadius(10)
            
            HStack(spacing: 12){
                VStack{
                    Text("\(viewModel.player1.score)")
                        .foregroundColor(Color.white)
                        .font(.custom("AvenirNext-Bold", size: 70))
                    Text(viewModel.player1.name)
                        .foregroundColor(Color.white)
                        .font(.custom("AvenirNext-Bold", size: 30))
                }.padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("firstplayer"))
                    .cornerRadius(10)
                    .shadow(color: viewModel.isFirst ? .white: .clear,
                            radius: 3)
                
                VStack{
                    Text("\(viewModel.player2.score)")
                        .foregroundColor(Color.white)
                        .font(.custom("AvenirNext-Bold", size: 70))
                    Text(viewModel.player2.name)
                        .foregroundColor(Color.white)
                        .font(.custom("AvenirNext-Bold", size: 30))
                }.padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("secondplayer"))
                    .cornerRadius(10)
                    .shadow(color: !viewModel.isFirst ? .white: .clear,
                            radius: 3)
            }
            
            textFild(word: $word, placeholder: "Ваше слово...")
            
            
            Button {
                
                var score = 0
                
                
                do{
                    try score = viewModel.check(word: self.word)
                } catch wordError.beforword{
                    textalert = "Таке слово вже було"
                    alert.toggle()
                } catch wordError.smallword{
                    textalert = "Надто мале слово"
                    alert.toggle()
                }catch wordError.sameWord{
                    textalert = "Це основне слово"
                    alert.toggle()
                }catch wordError.wrongword{
                    textalert = "Тaкого слова не має "
                    alert.toggle()
                }catch{
                    textalert = "Щось пішло не так "
                    alert.toggle()
                }
                
                
                if score > 0{
                    word = ""
                }
                
                
            } label: {
                Text("Готово")
                    .padding(10)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("maincolor"))
                    .font(.custom("AvenirNext-Bold", size: 23))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            List{
                Text("Ваші варіанти")
                ForEach(0..<self.viewModel.words.count, id: \.description) { item in
                    slovalist(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("firstplayer"): Color("secondplayer"))
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
                .edgesIgnoringSafeArea(.bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(15)
                .font(.custom("AvenirNext-Bold", size: 20))
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("Image").resizable().edgesIgnoringSafeArea(.all))
            .confirmationDialog("Ви впевнені що хочете повирнутись на головний екран?", isPresented: $confirmDismiss, titleVisibility: .visible){
                
                Button(role: .cancel) {
                    confirmDismiss.toggle()
                } label: {
                    Text("Hi")
                }
                
                Button(role: .destructive) {
                    dismiss()
                } label: {
                    Text("Taк")
                }
            }.alert(textalert, isPresented: $alert) {
                Text("OK")
            
    }
            
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "name1"), player2: Player(name: "name2"), word: "mainWord"))
    }
}

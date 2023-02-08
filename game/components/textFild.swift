//
//  textFild.swift
//  game
//
//  Created by Artem Leschenko on 03.02.2023.
//

import SwiftUI



struct textFild: View {
    
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: word)
            .font(.title2)
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .foregroundColor(Color.indigo)
    }
}



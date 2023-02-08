//
//  TitleText.swift
//  game
//
//  Created by Artem Leschenko on 03.02.2023.
//

import SwiftUI

struct TitleText: View {
    
    @State var text:String
    
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(Color.white)
            .font(.custom("AvenirNext-Bold", size: 23))
            .frame(maxWidth: .infinity)
            .background(Color("maincolor"))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
    }
}


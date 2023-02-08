//
//  slovalist.swift
//  Game words
//
//  Created by Artem Leschenko on 08.02.2023.
//

import SwiftUI

struct slovalist: View {
    
    let word: String
    
    
    var body: some View {
        HStack{
            Text(word)
                .font(.custom("AvenirNext-Bold", size: 23))
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                
            Text("\(word.count)")
                .font(.custom("AvenirNext-Bold", size: 23))
                .padding()
        }.foregroundColor(.white)
    }
}

struct slovalist_Previews: PreviewProvider {
    static var previews: some View {
        slovalist(word: "fbdsfb")
    }
}

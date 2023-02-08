//
//  b_Style.swift
//  game
//
//  Created by Artem Leschenko on 03.02.2023.
//

import SwiftUI

struct b_Style: View {
    
    var nameButton:String
    
    var body: some View {
        Button {
            print("dsc")
        } label: {
            Text(nameButton)
                .font(.custom("AvenirNext-Bold", size: 23))
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .foregroundColor(Color.white)
                .background(Color("maincolor"))
                .cornerRadius(10)
        }
    }
}

struct b_Style_Previews: PreviewProvider {
    static var previews: some View {
        b_Style(nameButton: "jhbjkb")
    }
}


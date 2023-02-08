//
//  erorView.swift
//  Game words
//
//  Created by Artem Leschenko on 05.02.2023.
//

import SwiftUI

struct erorView: View {
    var body: some View {
        HStack{
            Text(Image(systemName: "multiply.circle")).foregroundColor(Color.red)
                .font(.custom("AvenirNext-Bold", size: 23))
            
            Text("Something error")
                .font(.custom("AvenirNext-Bold", size: 23))
                .foregroundColor(Color.white)
        }.padding(10.0).frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("maincolor"))
            .cornerRadius(10)
            .padding(.horizontal, 20)

    }
}

struct erorView_Previews: PreviewProvider {
    static var previews: some View {
        erorView()
    }
}

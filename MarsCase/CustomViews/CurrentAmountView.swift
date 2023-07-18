//
//  CurrentAmountView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct CurrentAmountView: View {
    var body: some View {
        VStack {
            HStack {
                
                Text("TL 578,00").font(.largeTitle).padding(.trailing)
                Image("tc")
                    .resizable().frame(width: 25,height: 25,alignment: .center).cornerRadius(12.5)
                Button {
                    
                } label: {
                    Image(systemName: "chevron.down").foregroundColor(Color.gray)
                }

            }
            
            HStack {
                Text("Cüzdan ID: 54221476").font(.subheadline).foregroundColor(.gray)
                Button {
                    
                } label: {
                    Image(systemName: "square.on.square").foregroundColor(.gray)
                }

            }
            
            
        }
        
    }
}

struct CurrentAmountView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentAmountView()
    }
}

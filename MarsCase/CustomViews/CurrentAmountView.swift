//
//  CurrentAmountView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct CurrentAmountView: View {
    
    let amount:Double
    var body: some View {
        VStack {
          Text("Merhaba, Mehmet Bilir!").foregroundColor(.gray).padding(.top,20)
            HStack {
              Text(String(amount.asCurrencyWith6Decimals())).font(.largeTitle).padding(.trailing)
                CornerImage(imageName: "tl", frame: 25)
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
        CurrentAmountView(amount: 6573.98)
    }
}

//
//  CurrencyList.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI
import PopupView

struct CurrencyList: View {

    let currency:Currency
    @State var showingPopup = false
    var body: some View {
        
        HStack {
            
          CornerImage(imageName: currency.image.rawValue, frame: 50).padding(.leading)
           
            VStack {
              ScaleText(text: currency.name.rawValue).font(.subheadline)
              HStack {
                ScaleText(text: "\(currency.amount.reverse.asCurrencyWith2Decimals())").foregroundColor(currency.substract < 0.00 ? .green : .red).frame(alignment: .leading)
                Image(systemName:currency.substract < 0.00 ? "arrow.up" : "arrow.down").foregroundColor(currency.substract < 0.00 ? .green : .red)
              }.padding(.leading)

              }

          Spacer()
            Button("Satın Al") {
                showingPopup = true
            }.padding(.trailing).buttonStyle(.borderedProminent).tint(.black)
                
            

        }.sheet(isPresented: $showingPopup) {
            VStack {
              PopUpView(currency: currency)
                    .presentationDetents([.height(UIScreen.main.bounds.height / 1.4)])
            }
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
      CurrencyList(currency: .init(image: .yuan, name: .dolar, amount: 13213, sign: .tl,substract: 0.1))
    }
}

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
            
          CornerImage(imageName: currency.currencyType.image, frame: 50).padding(.leading)
           
            VStack {
              ScaleText(text: currency.currencyType.name).font(.subheadline)
              HStack {
                ScaleText(text: "\(currency.amount.reverse.asCurrencyWith2Decimals())").foregroundColor(currency.substract < 0.00 ? .green : .red)

              }.padding(.leading)

              }
          Spacer()
          Image(systemName:currency.substract < 0.00 ? "arrow.up" : "arrow.down").foregroundColor(currency.substract < 0.00 ? .green : .red).padding(.leading)

          Spacer()
            Button("buy_it") {
                showingPopup = true
            }.buttonStyle(.borderedProminent).tint(.black)
                
            

        }.sheet(isPresented: $showingPopup) {
            VStack {
              if #available(iOS 16.0, *) {
                PopUpView(currency: currency)
                  .presentationDetents([.height(UIScreen.main.bounds.height / 1.4)])
              } else {
                PopUpView(currency: currency)
              }
            }
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
      CurrencyList(currency: .init(currencyType: .sterlin, amount: 123, substract: 1))
    }
}

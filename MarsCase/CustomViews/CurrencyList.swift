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
              Text(currency.name.rawValue).font(.subheadline).frame(alignment: .leading)
              Text("\(pow(currency.amount,-1).asCurrencyWith2Decimals()) \(CurrencySign.tl.rawValue)").foregroundColor(currency.substract < 0.00 ? .green : .red).frame(alignment: .leading)
                
            }.padding(.leading)

          Image(systemName:currency.substract < 0.00 ? "arrow.up" : "arrow.down").padding(.top).foregroundColor(currency.substract < 0.00 ? .green : .red)
            Spacer()
            Button("Satın Al") {
                showingPopup = true
            }.padding(.trailing).buttonStyle(.borderedProminent).tint(.black)
                
            

        }.sheet(isPresented: $showingPopup) {
            VStack {
              PopUpView(currency: currency)
                    .presentationDetents([.height(UIScreen.main.bounds.height / 1.5)])
            }
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
      CurrencyList(currency: .init(image: .yuan, name: .dolar, amount: 13213, sign: .tl,substract: 0.1))
    }
}

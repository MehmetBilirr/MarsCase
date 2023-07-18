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
            
            CornerImage(imageName: currency.image, frame: 50).padding(.leading)
           
            VStack {
                Text(currency.name).font(.subheadline).frame(alignment: .leading)
                Text("\(currency.amount) \(currency.sign)").foregroundColor(.green).frame(alignment: .leading)
                
            }.padding(.leading)
            
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
        CurrencyList(currency: Currency.fake)
    }
}

//
//  MainView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct MainView: View {
    @State var showingPopup = false
    var amounts:[Currency] = [.init(image: "abd", name: "Dolar", amount: "20.45"),.init(image: "ab", name: "Euro", amount: "19,20"),.init(image: "eng", name: "Sterlin", amount: "25,45"),.init(image: "rus", name: "Rus Rublesi", amount: "20,45"),.init(image: "china", name: "Yuan", amount: "20.45")]
    @State var amount : Double = 2315.9123
    var body: some View {
        ZStack {
            VStack {
                
                Text("Merhaba, Mehmet Bilir!").foregroundColor(.gray).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 100))
                CurrentAmountView(amount: amount).padding(.top)
                Spacer()
                
                List {
                    ForEach(amounts) { item in
                        CurrencyList(image: item.image, name: item.name, amount: item.amount)
                }
                
                }
                
                Button {
                    
                    showingPopup = true
                } label: {
                    Label("Satın Al", systemImage: "plus").frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).buttonStyle(.borderedProminent)
                    .controlSize(.large).padding(.leading,8).padding(.trailing,8)
                
                Button {
                    
                } label: {
                    Label("Geçmiş İşlemler", systemImage: "clock.arrow.circlepath").frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).buttonStyle(.borderedProminent)
                    .controlSize(.large).padding(.leading,8).padding(.trailing,8)
            }.padding(.bottom,20)
        }
        
        
        
    }
    
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

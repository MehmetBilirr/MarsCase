//
//  CurrencyList.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI
import PopupView

struct CurrencyList: View {
    let image:String
    let name:String
    let amount:String
    @State var showingPopup = false
    var body: some View {
        
        HStack {
            
            Image(image)
                .resizable().frame(width: 50,height: 50,alignment: .center).cornerRadius(25).padding(.leading)
           
            VStack {
                Text(name).font(.subheadline).frame(alignment: .leading)
                Text(amount).foregroundColor(.green).frame(alignment: .leading)
                
            }.padding(.leading)
            
            Spacer()
            Button("Satın Al") {
                showingPopup = true
            }.padding(.trailing).buttonStyle(.borderedProminent).tint(.black)
                
            

        }
        .popup(isPresented: $showingPopup) {
                        Text("The popup")
                .frame(maxWidth: .infinity,maxHeight: UIScreen.main.bounds.size.height / 2)
                            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
                            .cornerRadius(30.0)
                    } customize: {
                        $0
                            .type(.floater(verticalPadding: 0, horizontalPadding: 0, useSafeAreaInset: false))
                                .position(.bottom)
                                .animation(.spring())
                                .closeOnTapOutside(true)
                                .dragToDismiss(true)
                                .backgroundColor(.black.opacity(0.5))
                    }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyList(image: Currency.fake.image, name: Currency.fake.name, amount: Currency.fake.amount)
    }
}

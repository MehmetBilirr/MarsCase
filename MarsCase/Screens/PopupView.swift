//
//  PopUpView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI

struct PopUpView: View {
    let currency:Currency
    @State var money:String = ""
    @State var totalCost:String = ""
    var body: some View {
        
        NavigationView {
            VStack {
               
                CornerImage(imageName: currency.image, frame: 100)
                Text("₺ \(currency.amount)").font(.title).foregroundColor(.green).padding(.all)
                Text("Satın almak istediğiniz \(currency.name)").font(.body)
                HStack {
                    
                    TextField("Tutar giriniz", text: $money).onChange(of: money) {
                        getTotalCost(amount: $0)
                    }.padding(.leading).keyboardType(.numberPad)
                    Text(currency.sign).padding(.trailing).font(.title)
                }.padding(.all).border(.gray,width: 0.5).cornerRadius(10).padding()
                
                Text("Toplam Maliyet").font(.body).padding(.trailing)
                HStack {
                    TextField("", text: $totalCost).padding(.leading).disabled(true)
                    Text(currency.sign).font(.title).padding(.trailing)
                }.padding(.all).border(.gray,width: 0.5).cornerRadius(10).padding()
                
                Button {
                    
                } label: {
                    Text("Satın Al").frame(width: 200,height: 30)
                }.padding(.trailing).buttonStyle(.borderedProminent).tint(.black)
                Spacer()

            }.background(.white)
        }
        
    }
    
    private func getTotalCost(amount:String){
      guard let doubleNumber = Double(amount) else {return}
                self.totalCost = String(doubleNumber * currency.amount)
        print(totalCost)
       
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(currency: Currency.fake)
    }
}

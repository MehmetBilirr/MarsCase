//
//  PopUpView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI
import RealmSwift

struct PopUpView: View {
    let currency:Currency
    @State var money:String = ""
    @State var totalCost:String = ""
  @ObservedResults(SavedCurrency.self) var savedCurrencies
  @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        NavigationView {
            VStack {
               
              CornerImage(imageName: currency.image.rawValue, frame: 100).padding(.all)
              Text("₺ \(currency.amount.reverse.asCurrencyWith6Decimals())").font(.title).foregroundColor(.green).padding(.all)
              Text("Satın almak istediğiniz \(currency.name.rawValue)").font(.body)
                HStack {
                    
                    TextField("Tutar giriniz", text: $money).onChange(of: money) {
                        getTotalCost(amount: $0)
                    }.padding(.leading).keyboardType(.numberPad)
                  Text(currency.sign.rawValue).padding(.trailing).font(.title)
                }.padding(.all).border(.gray,width: 0.5).cornerRadius(10).padding()
                
                Text("Toplam Maliyet").font(.body).padding(.trailing)
                HStack {
                  TextField("", text: $totalCost).padding(.leading).disabled(true)
                  Text(CurrencySign.tl.rawValue).font(.title).padding(.trailing)
                }.padding(.all).border(.gray,width: 0.5).cornerRadius(10).padding()
                
                Button {
                save()
                  print("adsasd")


                } label: {
                    Text("Satın Al").frame(width: 200,height: 30)
                }.padding(.all).buttonStyle(.borderedProminent).tint(.black)
                Spacer()

            }.background(.white)
        }
        
    }

  private func save(){
    let savedCurrency = SavedCurrency()
    savedCurrency.amount = currency.amount
    savedCurrency.image = currency.image.rawValue
    savedCurrency.sign = currency.sign.rawValue
    savedCurrency.name = currency.name.rawValue
    savedCurrency.date = Date()
    savedCurrency.total = money
    $savedCurrencies.append(savedCurrency)
  }
    
    private func getTotalCost(amount:String){
      guard let doubleNumber = Double(amount) else {return}
      let total = doubleNumber * pow(currency.amount,-1)
      self.totalCost = total.asCurrencyWith6Decimals()
       
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
      PopUpView(currency: Currency.fake)
    }
}

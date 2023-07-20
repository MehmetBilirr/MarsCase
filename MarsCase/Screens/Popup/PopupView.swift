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
  @StateObject var popupViewModel = PopupViewModel()
  @FocusState private var amountIsFocused: Bool
  @Environment(\.dismiss) private var dismiss
  var body: some View {

    NavigationView {
      VStack {

        CornerImage(imageName: currency.image.rawValue, frame: 75)
        HStack  {
          Text("\(currency.amount.reverse.asCurrencyWith2Decimals())").font(.title).foregroundColor(currency.substract < 0.00 ? .green : .red)
          Image(systemName:currency.substract < 0.00 ? "arrow.up" : "arrow.down").foregroundColor(currency.substract < 0.00 ? .green : .red)

        }
        HStack {
          Text("Satın almak istediğiniz \(currency.name.rawValue)").font(.body).padding(.leading,5)
          Spacer()
        }.padding()

        HStack {

          TextField("Tutar giriniz", text: $money).onChange(of: money) {
            getTotalCost(amount: $0)
          }.padding(.leading).keyboardType(.numberPad).focused($amountIsFocused)
          Text(currency.sign.rawValue).padding(.trailing).font(.title)
        }.padding(.all,10).border(.gray,width: 0.5).cornerRadius(10)
        HStack {
          Text("Toplam Maliyet").font(.body).padding(.trailing)
          Spacer()
        }.padding()

        HStack {
          TextField("", text: $totalCost).padding(.leading).disabled(true)
          Text(CurrencySign.tl.rawValue).font(.title).padding(.trailing)
        }.padding(.all,10).border(.gray,width: 0.5).cornerRadius(10)
        Button {
          popupViewModel.save(currency: currency, money: money)
          money = ""
          totalCost = ""
          amountIsFocused = false
        } label: {
          Text("Satın Al").frame(width: 200,height: 30)
        }.buttonStyle(.borderedProminent).tint(.black).padding()


      }.background(.white)
    }

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

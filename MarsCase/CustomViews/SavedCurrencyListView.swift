//
//  SavedCurrencyListView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 20.07.2023.
//

import SwiftUI

struct SavedCurrencyListView: View {
  let savedCurrent:SavedCurrency
    var body: some View {
      HStack {
        CornerImage(imageName: savedCurrent.image, frame: 50)
        VStack {
          HStack  {
            Text(savedCurrent.name)
            Text("purchase_d")
          }
          HStack  {
            Text("amount_purchased")
            Text(savedCurrent.amount.reverse.asCurrencyWith2Decimals())
          }.font(.footnote).foregroundColor(.gray).padding(.top,1)
          Text( savedCurrent.date.dateAndTimetoString()).font(.footnote).foregroundColor(.gray).padding(.top,1)
        }.layoutPriority(0.5)
        Spacer()
        Text("\(savedCurrent.sign) \(savedCurrent.total.currencyFormatting())").font(.title3).foregroundColor(.green).lineLimit(1)
        
      }
    }
}

struct SavedCurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
      SavedCurrencyListView(savedCurrent:SavedCurrency())
    }
}

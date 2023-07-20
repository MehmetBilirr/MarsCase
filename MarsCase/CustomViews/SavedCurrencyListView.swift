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
        CornerImage(imageName: savedCurrent.image, frame: 50).padding(.leading)
        VStack {
          Text("\(savedCurrent.name) Satın Alım")
          Text("Alınan fiyat: \(savedCurrent.amount.reverse.asCurrencyWith2Decimals())").font(.footnote).foregroundColor(.gray)
          Text(savedCurrent.date.asString).font(.footnote).foregroundColor(.gray)
        }.padding(.leading)
        Spacer()
        Text("\(savedCurrent.sign) \(savedCurrent.total)").font(.title2).padding(.leading).foregroundColor(.green)
        
      }
    }
}

struct SavedCurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
      SavedCurrencyListView(savedCurrent: SavedCurrency())
    }
}

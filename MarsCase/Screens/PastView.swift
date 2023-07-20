//
//  PastView.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import SwiftUI
import RealmSwift
struct PastView: View {
  @ObservedResults(SavedCurrency.self) var savedCurrencies
    var body: some View {

      if savedCurrencies.isEmpty {
        EmptyView()
      }else {
          Text("add")
      }

        
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView()
    }
}

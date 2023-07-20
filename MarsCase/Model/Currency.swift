//
//  Currency.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import Foundation


struct Currency:Identifiable {
    var id: String = UUID().uuidString
  static let fake = Self.init(currencyType: .dolar, amount: 1231.23, substract: 123.23)
    let currencyType:CurrencyType
    let amount:Double
    let substract:Double
}



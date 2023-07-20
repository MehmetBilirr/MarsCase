//
//  Currency.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import Foundation


struct Currency:Identifiable {
    var id: String = UUID().uuidString
  static let fake = Self.init(image: .ruble, name: .tl, amount: 0,sign: .tl,substract: 1)
    let image:CurrencyImageName
    let name:CurrencyName
    let amount:Double
    let sign:CurrencySign
    let substract:Double
}



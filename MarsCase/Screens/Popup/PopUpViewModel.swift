//
//  PopUpViewModel.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 20.07.2023.
//

import Foundation
import RealmSwift
import SwiftUI

class PopupViewModel:ObservableObject {
  @ObservedResults(SavedCurrency.self) var savedCurrencies

   func save(currency:Currency,money:String){
    let savedCurrency = SavedCurrency()
    savedCurrency.amount = currency.amount
    savedCurrency.image = currency.image.rawValue
    savedCurrency.sign = currency.sign.rawValue
    savedCurrency.name = currency.name.rawValue
    savedCurrency.date = Date()
    savedCurrency.total = money
    $savedCurrencies.append(savedCurrency)
  }


}

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
     savedCurrency.image = currency.currencyType.image
     savedCurrency.sign = currency.currencyType.sign
     savedCurrency.name = currency.currencyType.name
    savedCurrency.date = Date()
    savedCurrency.total = money
    $savedCurrencies.append(savedCurrency)
  }


}

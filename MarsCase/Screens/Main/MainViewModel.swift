//
//  MainViewModel.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation
import SwiftUI
import Combine

class MainViewModel:ObservableObject {

  private let webService = WebService()
  private var cancellables: Set<AnyCancellable>
  @Published var currencies : [Currency]
  private var dic = [String:Double]()

  init(cancellables: Set<AnyCancellable> = [], currencies: [Currency] = [Currency]()) {
    self.cancellables = cancellables
    self.currencies = currencies
    getData()
  }

  private func getData() {
    webService.getData(route: .getData)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .finished:
          print("Finished getting movies")
        case .failure(let error):
          print("Error getting movies: \(error)")
        }
      } receiveValue: { [weak self] datas in

        self?.getCurrencies(data: datas.data)
      }.store(in: &cancellables)
  }

  private func getCurrencies(data:[String:CurrencyResponse]){

    guard let twoDaysBefore = data[Constant.twoDayBefore] else {return}

    guard let yesterday = data[Constant.yesterday] else {return}


    let dolar = yesterday.USD, euro = yesterday.EUR, sterlin = yesterday.GBP, ruble = yesterday.RUB, yuan = yesterday.CNY

    let dolar2 = twoDaysBefore.USD, euro2 = twoDaysBefore.EUR, sterlin2 = twoDaysBefore.GBP, ruble2 = twoDaysBefore.RUB, yuan2 = twoDaysBefore.CNY


    currencies = [.init(currencyType: .dolar, amount: dolar, substract: diff(num1: dolar, num2: dolar2)),.init(currencyType: .euro, amount: euro, substract: diff(num1: euro, num2: euro2)),.init(currencyType: .sterlin, amount: sterlin, substract: diff(num1: sterlin, num2: sterlin2)),.init(currencyType: .ruble, amount: ruble, substract: diff(num1: ruble, num2: ruble2)),.init(currencyType: .yuan, amount: yuan, substract: diff(num1: yuan, num2: yuan2))]

  }


  
  private func diff(num1:Double,num2:Double)-> Double {
    return num1 - num2
  }

}

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

  private func getCurrencies(data:[String:[String:Double]]){

    guard let twoDaysBefore:[String:Double] = data[Constant.twoDayBefore] else {return}

    guard let yesterday:[String:Double] = data[Constant.yesterday] else {return}


        guard let dolar = yesterday[CurrencyCode.dolar.rawValue], let euro = yesterday[CurrencyCode.euro.rawValue], let sterlin = yesterday[CurrencyCode.sterlin.rawValue],let ruble = yesterday[CurrencyCode.ruble.rawValue], let yuan = yesterday[CurrencyCode.yuan.rawValue] else {return}

    guard let dolar2 = twoDaysBefore[CurrencyCode.dolar.rawValue], let euro2 = twoDaysBefore[CurrencyCode.euro.rawValue], let sterlin2 = twoDaysBefore[CurrencyCode.sterlin.rawValue],let ruble2 = twoDaysBefore[CurrencyCode.ruble.rawValue], let yuan2 = twoDaysBefore[CurrencyCode.yuan.rawValue] else {return}

    currencies = [.init(image: .dolar, name: .dolar, amount: dolar, sign: .dolar,substract: diff(num1: dolar, num2: dolar2)),.init(image: .euro, name: .euro, amount: euro, sign: .euro,substract: diff(num1: euro, num2: euro2)),.init(image: .sterlin, name: .sterlin, amount: sterlin, sign: .sterlin,substract: diff(num1: sterlin, num2: sterlin2)),.init(image: .ruble, name: .ruble, amount: ruble, sign: .ruble,substract: diff(num1: ruble, num2: ruble2)),.init(image: .yuan, name: .yuan, amount: yuan, sign: .yuan,substract: diff(num1: yuan, num2: yuan2))]

  }
  
  private func diff(num1:Double,num2:Double)-> Double {
    return num1 - num2
  }

}

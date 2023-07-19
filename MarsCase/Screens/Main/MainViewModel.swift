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


  init(cancellables: Set<AnyCancellable> = [], currencies: [Currency] = [Currency]()) {
    self.cancellables = cancellables
    self.currencies = currencies
    fetchMovies()
  }

  func fetchMovies() {
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

  private func getCurrencies(data:[String:Double]){

    guard let dolar = data["USD"], let euro = data["EUR"], let sterlin = data["GBP"],let ruble = data["RUB"], let yuan = data["CNY"] else {return}

    currencies = [.init(image: "abd", name: "Dolar", amount: dolar, sign: Constant.dolar),.init(image: "ab", name: "Euro", amount: euro, sign: Constant.euro),.init(image: "eng", name: "Sterlin", amount: sterlin, sign: Constant.sterlin),.init(image: "rus", name: "Ruble", amount: ruble, sign: Constant.ruble),.init(image: "china", name: "Yuan", amount: yuan, sign: Constant.yuan)]

  }
}

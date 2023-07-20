//
//  ApiResponse.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation

struct ApiResponse: Codable {
  let data: [String: CurrencyResponse]
}



struct CurrencyResponse:Codable {
    let EUR, USD, GBP, RUB, CNY : Double
}

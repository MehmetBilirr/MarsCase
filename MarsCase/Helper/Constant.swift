//
//  Constant.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import Foundation

struct Constant {
    
    static let tl = "₺"
    static let dolar = "$"
    static let sterlin = "£"
    static let euro = "€"
    static let ruble = "₽"
    static let yuan = "¥"
    static let api_key = "fca_live_apaW2pTdVBD3dKqdFA4NBmnJcCbgeerN58SbDYlP"
  static let currencies = "USD%2CEUR%2CGBP%2CRUB%2CCNY"
  static var components : URLComponents{
    var com = URLComponents()
    com.queryItems = [
       URLQueryItem(name: "apikey", value: api_key),
       URLQueryItem(name: "currencies", value: currencies),
       URLQueryItem(name: "base_currency", value: "TRY")
       ]
       return com

  }
    
}

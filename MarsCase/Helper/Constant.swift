//
//  Constant.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import Foundation
import RealmSwift

struct Constant {
  static let api_key = "fca_live_apaW2pTdVBD3dKqdFA4NBmnJcCbgeerN58SbDYlP"
  static let currencies = "USD%2CEUR%2CGBP%2CRUB%2CCNY"
  static let yesterday = Date().getYesterday()
  static let twoDayBefore = Date().get2DayBefore()
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


enum CurrencySign :String {

  case tl = "₺"
  case dolar = "$"
  case sterlin = "£"
  case euro = "€"
  case ruble = "₽"
  case yuan = "¥"
}


enum CurrencyName:String {
  
  case tl = "Turkish Lira"
  case dolar = "Dolar"
  case sterlin = "Sterlin"
  case euro = "Euro"
  case ruble = "Ruble"
  case yuan = "Yuan"
}


enum CurrencyImageName:String {

  case tl = "tl"
  case dolar = "dolar"
  case sterlin = "sterlin"
  case euro = "euro"
  case ruble = "ruble"
  case yuan = "yuan"
}

enum CurrencyCode:String,Codable {

  case tl = "TRY"
  case dolar = "USD"
  case sterlin = "GBP"
  case euro = "EUR"
  case ruble = "RUB"
  case yuan = "CNY"
}

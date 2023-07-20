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

enum CurrencyType {

  case tl
  case dolar
  case sterlin
  case euro
  case ruble
  case yuan

  var sign:String {
    switch self {
    case .tl:
      return "₺"
    case .dolar:
      return "$"
    case .sterlin:
      return "£"
    case .euro:
      return "€"
    case .ruble:
      return "₽"
    case .yuan:
      return "¥"
    }
  }

  var name:String {
    switch self {
    case .tl:
    return "Turkish Lira"
    case .dolar:
    return  "Dolar"
    case .sterlin:
    return  "Sterlin"
    case .euro:
    return  "Euro"
    case .ruble:
    return  "Ruble"
    case .yuan:
    return "Yuan"
    }
  }

  var image:String {
    switch self {
    case .tl:
      return "tl"
    case .dolar:
      return "dolar"
    case .sterlin:
      return "sterlin"
    case .euro:
      return "euro"
    case .ruble:
      return "ruble"
    case .yuan:
      return "yuan"
    }
  }


}


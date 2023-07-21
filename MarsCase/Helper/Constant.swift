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



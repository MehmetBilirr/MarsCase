//
//  Route.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation


enum Route {

  static let baseUrl = "https://api.freecurrencyapi.com/v1"
  case getData

  var description:String {
    return "/latest?apikey=\(Constant.api_key)&currencies=\(Constant.currencies)&base_currency=TRY"
  }

    var method:Method {
      return .get
    }

    var urlString:String {
      return Route.baseUrl + description
    }


    var components:URLComponents {
      return Constant.components
    }
}

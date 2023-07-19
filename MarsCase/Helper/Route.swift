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
    return "/historical?apikey=\(Constant.api_key)&currencies=\(Constant.currencies)&base_currency=TRY&date_from=\(Constant.twoDayBefore)T15%3A46%3A39.983Z&date_to=\(Constant.yesterday)T15%3A46%3A39.983Z"
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

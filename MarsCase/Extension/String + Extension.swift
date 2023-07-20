//
//  String + Extension.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation

extension String {

  var asURL:URL? {
    return URL(string: self)
  }

      func currencyFormatting() -> String {
          if let value = Double(self) {
              let formatter = NumberFormatter()
              formatter.numberStyle = .currency
              formatter.maximumFractionDigits = 2
              formatter.minimumFractionDigits = 2
              if let str = formatter.string(for: value) {
                  return str
              }
          }
          return ""
      }
  
}

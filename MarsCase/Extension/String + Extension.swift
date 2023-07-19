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
}

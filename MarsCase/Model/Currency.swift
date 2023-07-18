//
//  Currency.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 18.07.2023.
//

import Foundation

struct Currency:Identifiable {
    var id: String = UUID().uuidString
    static let fake = Self.init(image: "rus", name: "Turkish Lira", amount: "19.23",sign: Constant.tl)
    let image:String
    let name:String
    let amount:String
    let sign:String
}


